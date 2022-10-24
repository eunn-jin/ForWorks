package com.kh.forworks.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardController {
		//커뮤니티 (화면)
		@GetMapping("list")
		public String list(){
			return "board/list";
		}
		
		//커뮤니티 게시글 작성
		@GetMapping("write")
		public String write() {
			return"board/write";
		}
		
		//커뮤니티 게시글 상세보기
		@GetMapping("detail")
		public String detail() {
			return"board/detail";
		}
		
		//커뮤니티 게시글 수정
		@GetMapping("update")
		public String update() {
			return"board/update";
		}
}
