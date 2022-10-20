package com.kh.forworks.address.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("address")
public class AddressController {
	
	@GetMapping("main")
	public String main() {
		return "address/mainAddress2";
	}
	
	@GetMapping("main2")
	public String main2() {
		return "address/mainAddress";
	}
}
