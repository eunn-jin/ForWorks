package com.kh.forworks.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@GetMapping("")
	public String login() {
		return "admin/admin-login";
	}
	
	@GetMapping("main")
	public String main() {
		return "admin/admin-main";
	}
	
	@GetMapping("pos")
	public String pos() {
		return "admin/admin-position";
	}
	
	@GetMapping("approval")
	public String memberApprove() {
		return "admin/admin-memberapprove";
	}
	
	@GetMapping("member")
	public String memberList() {
		return "admin/admin-memberlist";
	}
	
	@GetMapping("oper")
	public String oper() {
		return "admin/admin-operator";
	}
}
