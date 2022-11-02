package com.kh.forworks.off.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forworks.off.service.OffService;

@Controller
@RequestMapping("off")
public class OffController {

	private final OffService service;
	
	@Autowired
	public OffController(OffService service) {
		this.service = service;
	}
	
	@GetMapping("manage")
	public String offManage() {
		return "off/offManagement";
	}
	
	@GetMapping("confirm")
	public String offConfirm() {
		return "off/offConfirm";
	}
}
