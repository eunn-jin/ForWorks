package com.kh.forworks.survey.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("survey")
public class SurveyController {
	
	// 설문 리스트
	@GetMapping("list")
	public String vote() {
		
		return "survey/list";
	}
	
	//설문 생성
	@GetMapping("create")
	public String create() {
		return "survey/create";
	}
	
	//설문 상세보기(생성자)
	@GetMapping("detailCreator")
	public String deatilCreator() {
		return "survey/detailCreator";
	}
	
	//설문 상세보기(사용자)
		@GetMapping("detailUser")
		public String detaiUser() {
			return "survey/detailUser";
		}

}
