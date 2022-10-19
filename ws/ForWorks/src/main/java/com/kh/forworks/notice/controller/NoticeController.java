package com.kh.forworks.notice.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forworks.notice.service.NoticeService;
import com.kh.forworks.notice.vo.NoticeVo;

@Controller
@RequestMapping("notice")
public class NoticeController {
	
	private final NoticeService ntService;
	
	public NoticeController(NoticeService ntService) {
		this.ntService = ntService;
	}

	//공지사항 (화면)
	@GetMapping("noticeList")
	public String noticeList(){
		
		//공지사항 리스트 가져오기
		//List<NoticeVo> list = ntService. 
		return "notice/noticeList";
	}
	
	//공지사항 작성
	@GetMapping("noticeWrite")
	public String noticeWrite() {
		return"notice/noticeWrite";
	}
	
	//공지사항 상세보기
	@GetMapping("noticeDetail")
	public String noticeDetail() {
		return"notice/noticeDetail";
	}
	
	//공지사항 수정
	@GetMapping("noticeUpdate")
	public String noticeUpdate() {
		return"notice/noticeUpdate";
	}
}
