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
import com.kh.forworks.bonus.vo.BonusMemVo;
import com.kh.forworks.bonus.vo.BonusVo;
import com.kh.forworks.member.vo.MemberVo;

@Controller
@RequestMapping("bonus")
public class BonusController {
	
	private BonusService bs;
	
	@Autowired
	public BonusController(BonusService bs) {
		this.bs = bs;
	}
	
	//�󿩱���Ʈ
	
	//�󿩱ݸ����ȸ(ȭ��)
	@GetMapping("list")
	public String list(Model model) {
		List<BonusVo> voList = bs.bonusList();
		model.addAttribute("bonusList" , voList);
		return "bonus/bonus_list";
	}
	
	//�󿩱� �ش� ���������ȸ
	@GetMapping("memList/{no}")
	public String memlist(@PathVariable String no , Model model) {
		List departList = bs.selectDepartList();
		model.addAttribute("departList",departList);
		
		List<BonusMemVo> voList = bs.memList(no);
		model.addAttribute("memList", voList);
		return "bonus/bonus_mem_list";
	}
	
	//�⵵�� �󿩱� ��ȸ
	@PostMapping(value="yearList" , produces = "application/json; charset=utf-8")
	@ResponseBody
	public String yearList(String year) {
		System.out.println(year);
		List voList = bs.bonusYearList(year);
		System.out.println(voList);
		Gson g = new Gson();
		return g.toJson(voList);
	}
	//�󿩱� ���ajax
	@PostMapping("add")
	@ResponseBody
	public String add(BonusVo bv) {
		System.out.println(bv);
		int result = bs.addBonus(bv);
		return ""+result;
	}
	
	
	
	//������Ʈ
	
	
	
	//������� ��������Ʈ ������
	@GetMapping("benefit")
	public String benefit(Model model) {
		List departList = bs.selectDepartList();
		
		model.addAttribute("departList",departList);
		return "bonus/benefit_list";
	}
	//�����߰�
	@PostMapping("addBenefit")
	@ResponseBody
	public String addBenefit(String title) {
		System.out.println("ajax�� �Ѿ�� title ::" + title);
		int result = bs.insertBenefit(title);
		return ""+result;
	}
	//�μ���  ������ȸ
	@PostMapping(value="selectEmp",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectEmp(String depart, Model model) {
		System.out.println("ajax�� �Ѿ�� depart ::" + depart);
		List result = bs.selectEmp(depart);
		Gson g = new Gson();
		return g.toJson(result);
		//1. GSON ���̺귯��
		//2. g = new Gson() ��ü ����
		//3. g.toJson(������);
	}
	
	//������ ����������ȸ
	@GetMapping("detail/{no}")
	public String detail(@PathVariable String no,Model model ) {
		//����ī�װ� ��ȸ
		List benefitList = bs.selectList();
		model.addAttribute("benefitList",benefitList);
		
		List<BenefitVo> bv = bs.selectOne(no);
		model.addAttribute("benefitVo",bv);
		model.addAttribute("empNo",no);
		System.out.println("���"+bv);
		return "bonus/benefit_list_detail";
	}
	
	//������ ������������
	@PostMapping("detail/edit")
	public String detail(Model model, BenefitVo vo) {
		System.out.println("������ ���� �ߵ���?" + vo);
		List<BenefitVo> updateBenefit = bs.edit(vo);
		model.addAttribute("BenefitVo", updateBenefit);
		return "redirect:/bonus/detail/" + vo.getEmpNo();
	}
	
	
}
