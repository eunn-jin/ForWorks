package com.kh.forworks.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("rsv")
public class RsvController {
	
	@GetMapping("list")
	public String list() {
		
		return "reservation/list";
	}
}
