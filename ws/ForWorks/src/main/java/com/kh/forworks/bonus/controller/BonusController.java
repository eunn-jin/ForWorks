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

import com.google.gson.Gson;
import com.kh.forworks.bonus.service.BonusService;
import com.kh.forworks.bonus.vo.BenefitVo;
import com.kh.forworks.bonus.vo.BonusVo;

@Controller
@RequestMapping("bonus")
public class BonusController {
	
	private BonusService bs;
	
	@Autowired
	public BonusController(BonusService bs) {
		this.bs = bs;
	}
	
	//상여금목록조회(화면)
	@GetMapping("list")
	public String list(Model model) {
		List<BonusVo> voList = bs.bonusList();
		model.addAttribute("bonusList" , voList);
		return "bonus/bonus_list";
	}
	
	//상여금 해당 직원목록조회
	@GetMapping("memList")
	public String memlist() {
		return "bonus/bonus_mem_list";
	}
	//수당관리 직원리스트 페이지
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
	//부서별  직원조회
	@PostMapping(value="selectEmp",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectEmp(String depart, Model model) {
		System.out.println("ajax로 넘어온 depart ::" + depart);
		List result = bs.selectEmp(depart);
		Gson g = new Gson();
		return g.toJson(result);
		//1. GSON 라이브러리
		//2. g = new Gson() 객체 생성
		//3. g.toJson(데이터);
	}
	
	//직원별 수당정보조회
	@GetMapping("detail/{no}")
	public String detail(@PathVariable String no,Model model ) {
		List<BenefitVo> bv = bs.selectOne(no);
		model.addAttribute("benefitVo",bv);
		System.out.println("출력"+bv);
		return "bonus/benefit_list_detail";
	}
	
	//직원별 수당정보수정
	@PostMapping("detail/edit")
	public String detail(Model model, BenefitVo vo) {
		System.out.println("수정된 정보 잘들어옴?" + vo);
		List<BenefitVo> updateBenefit = bs.edit(vo);
		model.addAttribute("BenefitVo", updateBenefit);
		return "redirect:/bonus/detail/" + vo.getEmpNo();
	}
	
	//???????
	@PostMapping("empBenefit")
	public String SelectEmpBenefit(String depart, String emp) {
		BenefitVo bv = bs.selectEmpBenefit(depart, emp);
		return "";
	}
}
