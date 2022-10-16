package com.kh.forworks.salary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("salary")
public class SalaryController {
	
	@GetMapping("main")
	public String main() {
		return "salary/sal_main";
	}
	
	@GetMapping("list")
	public String list() {
		return "salary/sal_list";
	}
	
	@GetMapping("write")
	public String write() {
		return "salary/sal_write";
	}
	
	@GetMapping("payslip")
	public String payslip() {
		return "salary/payslip";
	}
}
