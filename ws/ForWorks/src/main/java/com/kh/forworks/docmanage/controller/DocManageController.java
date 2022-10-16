package com.kh.forworks.docmanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("docManage")
public class DocManageController {
	
	@GetMapping("list")
	public String list() {
		return "docManage/doc_list";
	}
	
	@GetMapping("write")
	public String write() {
		return "docManage/doc_write";
	}
	
	@GetMapping("detail")
	public String detail() {
		return "docManage/doc_detail";
	}
}
