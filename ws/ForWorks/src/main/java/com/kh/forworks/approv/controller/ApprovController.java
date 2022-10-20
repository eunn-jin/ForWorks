package com.kh.forworks.approv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forworks.approv.service.ApprovService;

@Controller
@RequestMapping("approv")
public class ApprovController {
	
	private final ApprovService service;
	
	public ApprovController(ApprovService service) {
		this.service = service;
	}

	@GetMapping("main")
	public String main() {
		return "approv/approv-main";
	}
	
	@GetMapping("create")
	public String create() {
		return "approv/approv-create";
	}
	
	@GetMapping("detail")
	public String detail() {
		return "approv/approv-detail";
	}
	
	@GetMapping("coop")
	public String coop() {
		return "approv/coop-detail";
	}
	
	@GetMapping("refer")
	public String refer() {
		return "approv/refer-detail";
	}
	
	@GetMapping("form/create")
	public String createForm() {
		return "approv/form-create";
	}
	
	@GetMapping("form/main")
	public String mainForm() {
		return "approv/form-main";
	}
	
	@GetMapping("form/detail")
	public String detailForm() {
		return "approv/form-detail";
	}
	
	@GetMapping("form/edit")
	public String editForm() {
		return "approv/form-edit";
	}
	
	@GetMapping("sign/create")
	public String createSign() {
		return "approv/sign-create";
	}
	
	@GetMapping("sign/edit")
	public String editSign() {
		return "approv/sign-edit";
	}
}
