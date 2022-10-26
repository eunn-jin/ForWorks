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
	//�޿������� ����ȭ��
	@GetMapping("main")
	public String main() {
		return "salary/sal_main";
	}
	//�޿����� ��� ȭ��
	@GetMapping("list")
	public String list() {
		return "salary/sal_list";
	}
	//�޿����� ȭ��
	@GetMapping("payslip")
	public String payslip() {
		return "salary/payslip";
	}
	//�޿����� �ۼ� ȭ��
	@GetMapping("write")
	public String write(Model model) {
		List departList = ss.selectDepartList();
		model.addAttribute("departList",departList);
		System.out.println(departList);
		return "salary/sal_write";
	}
	//�μ��� ������ȸ
	@PostMapping(value="selectEmp",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectEmp(String depart, Model model) {
		List<MemberVo> result = ss.selectEmp(depart);
		Gson g = new Gson();
		return g.toJson(result);
	}
}
