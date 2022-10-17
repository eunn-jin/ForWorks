package com.kh.forworks.bonus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("bonus")
public class BonusController {
	
	@GetMapping("list")
	public String list() {
		return "bonus/bonus_list";
	}
	
	@GetMapping("memList")
	public String memlist() {
		return "bonus/bonus_mem_list";
	}
	
	@GetMapping("benefit")
	public String benefit() {
		return "bonus/benefit_list";
	}
}
