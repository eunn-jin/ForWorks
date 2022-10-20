package com.kh.forworks.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.forworks.member.vo.MemberVo;

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
	
	@PostMapping("join")
	public String join(MemberVo vo) {
		System.out.println(vo);
		
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
