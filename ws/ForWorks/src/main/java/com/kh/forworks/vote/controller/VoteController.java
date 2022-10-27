package com.kh.forworks.vote.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forworks.vote.service.VoteService;

@Controller
@RequestMapping("vote")
public class VoteController {
	
	private final VoteService vtsv;
	
	@Autowired
	public VoteController(VoteService vtsv) {
		this.vtsv = vtsv;
	}

	// 투표 리스트
	@GetMapping("list")
	public String vote() {
		
		return "vote/list";
	}
	
	//투표 생성
	@GetMapping("create")
	public String create() {
		return "vote/create";
	}
	
	//투표 상세보기(생성자)
	@GetMapping("detailCreator")
	public String deatilCreator() {
		return "vote/detailCreator";
	}
	
	//투표 상세보기(사용자)
		@GetMapping("detailUser")
		public String detaiUser() {
			return "vote/detailUser";
		}

}
