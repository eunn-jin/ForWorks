package com.kh.forworks.salary.controller;

import java.util.List;

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

@Controller
@RequestMapping("salary")
public class SalaryController {
	
	private SalaryService ss;
	
	@Autowired
	public SalaryController(SalaryService ss) {
		this.ss = ss;
	}
	//급여관리자 메인화면
	@GetMapping("main")
	public String main() {
		return "salary/sal_main";
	}
	//급여대장 목록 화면
	@GetMapping("list")
	public String list() {
		return "salary/sal_list";
	}
	//급여명세서 화면
	@GetMapping("payslip")
	public String payslip() {
		return "salary/payslip";
	}
	//급여대장 작성 화면
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
}
