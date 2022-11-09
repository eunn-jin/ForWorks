package com.kh.forworks.planPop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forworks.planPop.vo.PlanPopVo;


@Controller

//일정 캘린더 화면 보여주기
@RequestMapping("plan")
public class PlanPopController {
	@GetMapping("planPop")
	
	public String calendar() {
		return "plan/planPop";
	}
	
	@PostMapping("planPop")
	public String planPop(PlanPopVo vo) {
		
	}
}	