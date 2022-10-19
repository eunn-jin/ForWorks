package com.kh.forworks.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class MemberController {

	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("join")
	public String join() {
		return "member/join";
	}
	
	@GetMapping("mypage")
	public String mypage() {
		return "member/mypage-main";
	}
	
	@GetMapping("mypage/account")
	public String mypageAccount() {
		return "member/mypage-account";
	}
}
