package com.kh.forworks.approv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApprovController {

	@GetMapping("approv/main")
	public String main() {
		return "approv/approv-main";
	}
	
	@GetMapping("approv/create")
	public String create() {
		return "approv/approv-create";
	}
	
	@GetMapping("approv/detail")
	public String detail() {
		return "approv/approv-detail";
	}
	
	@GetMapping("approv/coop")
	public String coop() {
		return "approv/coop-detail";
	}
	
	@GetMapping("approv/refer")
	public String refer() {
		return "approv/refer-detail";
	}
	
	@GetMapping("approv/form/create")
	public String createForm() {
		return "approv/form-create";
	}
	
	@GetMapping("approv/form/main")
	public String mainForm() {
		return "approv/form-main";
	}
	
	@GetMapping("approv/form/detail")
	public String detailForm() {
		return "approv/form-detail";
	}
	
	@GetMapping("approv/form/edit")
	public String editForm() {
		return "approv/form-edit";
	}
}
