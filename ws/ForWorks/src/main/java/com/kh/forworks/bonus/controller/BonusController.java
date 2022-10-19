package com.kh.forworks.bonus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.forworks.bonus.service.BonusService;
import com.kh.forworks.bonus.vo.BenefitVo;

@Controller
@RequestMapping("bonus")
public class BonusController {
	
	private BonusService bs;
	
	@Autowired
	public BonusController(BonusService bs) {
		this.bs = bs;
	}

	@GetMapping("list")
	public String list() {
		return "bonus/bonus_list";
	}
	
	@GetMapping("memList")
	public String memlist() {
		return "bonus/bonus_mem_list";
	}
	
	@GetMapping("benefit")
	public String benefit(Model model) {
		List departList = bs.selectDepartList();
		List benefitList = bs.selectList();
		model.addAttribute("benefitList",benefitList);
		model.addAttribute("departList",departList);
		return "bonus/benefit_list";
	}
	//수당추가
	@PostMapping("addBenefit")
	@ResponseBody
	public String addBenefit(String title) {
		System.out.println("ajax로 넘어온 title ::" + title);
		int result = bs.insertBenefit(title);
		return ""+result;
	}
	//부서별 검색시 직원조회
	@PostMapping("selectEmp")
	@ResponseBody
	public List selectEmp(String depart, Model model) {
		System.out.println("ajax로 넘어온 depart ::" + depart);
		List result = bs.selectEmp(depart);
		System.out.println(result);
		model.addAttribute("EmpList",result);
		return result;
	}
	//직원별 수당정보조회
	@GetMapping("detail/{no}")
	public String detail(@PathVariable String no,Model model ) {
		List<BenefitVo> bv = bs.selectOne(no);
		model.addAttribute("benefitVo",bv);
		System.out.println(bv);
		return "bonus/benefit_list_detail";
	}
	//직원별 수당정보수정
	@PostMapping("detail/{no}")
	public String detail(@PathVariable String no, Model model, BenefitVo bv) {
		/////////////////////////////////////수정하기
		return "bonus/benefit_list_detail";
	}
	
	
	@PostMapping("empBenefit")
	public String SelectEmpBenefit(String depart, String emp) {
		BenefitVo bv = bs.selectEmpBenefit(depart, emp);
		return "";
	}
}
