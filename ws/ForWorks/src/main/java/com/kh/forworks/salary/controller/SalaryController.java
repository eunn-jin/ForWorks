package com.kh.forworks.salary.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.forworks.member.vo.MemberVo;
import com.kh.forworks.salary.service.SalaryService;
import com.kh.forworks.salary.vo.SalBonusVo;
import com.kh.forworks.salary.vo.SalaryVo;

@Controller
@RequestMapping("salary")
public class SalaryController {
	
	private SalaryService ss;
	
	@Autowired
	public SalaryController(SalaryService ss) {
		this.ss = ss;
	}
	//급여관리자 메인(화면)
	@GetMapping("main")
	public String main() {
		return "salary/sal_main";
	}
	//급여대장목록 (화면)
	@GetMapping("list")
	public String list(Model model) {
		List departList = ss.selectDepartList();
		model.addAttribute("departList",departList);
		return "salary/sal_list";
	}
	//급여명세서(화면)
	@GetMapping("payslip")
	public String payslip() {
		return "salary/payslip";
	}
	//급여대장작성(화면)
	@GetMapping("write")
	public String write(Model model) {
		List departList = ss.selectDepartList();
		model.addAttribute("departList",departList);
		System.out.println(departList);
		return "salary/sal_write";
	}
	//부서별 직원조회
	@PostMapping(value="selectEmp",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectEmp(String depart, Model model) {
		List<MemberVo> result = ss.selectEmp(depart);
		Gson g = new Gson();
		return g.toJson(result);
	}
	
	//급여대장작성 - 상여금 불러오기
	@PostMapping(value="empBonus",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String empBonus(SalaryVo sv) {
		//해당직원 날짜 사이 상여금 조회
		List<SalBonusVo> result = ss.selectBonus(sv);
		System.out.println(result);
		Gson g = new Gson();
		return g.toJson(result);
	}
	
	//급여대장작성 - 기본급+수당
	@PostMapping(value="empSal",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String empSal(SalaryVo sv) {
		//기본급 + 각종 수당 조회
		List<SalaryVo> sal = ss.selectEmpSal(sv);
		System.out.println("기본급 : " + sal);
		Gson g = new Gson();
		return g.toJson(sal);
	}
	
	//급여대장작성 - 초과수당 조회
	@PostMapping(value="addBenefit",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String addBenefit(SalaryVo sv) {
		List<SalaryVo> result = ss.selectAddBenefit(sv);
		return "";
	}
	
	//급여대장작성
	@PostMapping("write")
	public String insertSal(SalaryVo sv, HttpSession session) {
		int result = ss.insertSal(sv);
		if(result == 1) {
			return "redirect:/salary/list";			
		}else {
			return "salary/sal_write";
		}
	}
	
	
}


















