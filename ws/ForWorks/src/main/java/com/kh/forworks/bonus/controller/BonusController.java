package com.kh.forworks.bonus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.forworks.bonus.service.BonusService;

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
	public String benefit() {
		return "bonus/benefit_list";
	}
	
	@PostMapping("addBenefit")
	@ResponseBody
	public String addBenefit(String title) {
		System.out.println("ajax로 넘어온 title ::" + title);
		int result = bs.insertBenefit(title);
		return ""+result;
	}
}
