package com.kh.forworks.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forworks.admin.service.AdminService;
import com.kh.forworks.admin.vo.AdminVo;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	private final AdminService adminService;
	
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@GetMapping("")
	public String login() {
		return "admin/admin-login";
	}
	
	@PostMapping("login")
	public String login(AdminVo vo, HttpSession session) {
		AdminVo chiefAdmin = adminService.login(vo);
		
		if(chiefAdmin != null) {
			session.setAttribute("chiefAdmin", chiefAdmin);
			return "redirect:/admin/main";
		} else {
			session.setAttribute("toastMsg", "로그인 실패");
			return "redirect:/admin";
		}
		
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
