package com.kh.forworks.plan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forworks.plan.vo.PlanVo;

@Controller

//일정 캘린더 화면 보여주기
@RequestMapping("plan")
public class PlanController {
	@GetMapping("calendar")
	
	public String calendar() {
		return "plan/calendar";
	}
}	