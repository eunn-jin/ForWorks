package com.kh.forworks.docmanage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forworks.docmanage.service.DocmanageService;
import com.kh.forworks.docmanage.vo.DocVo;
import com.kh.forworks.member.vo.MemberVo;

@Controller
@RequestMapping("docmanage")
public class DocmanageController {
	
	private DocmanageService ds;
	
	@Autowired
	public DocmanageController(DocmanageService ds) {
		this.ds = ds;
	}
	//일반문서 리스트(화면)
	@GetMapping("list")
	public String list(Model model) {
		List<DocVo> result = ds.selectDoc();
		System.out.println(result);
		model.addAttribute("result",result);
		return "docManage/doc_list";
	}
	//일반문서 작성(화면)
	@GetMapping("write")
	public String write() {
		return "docManage/doc_write";
	}
	//일반문서 디테일(화면)
	@GetMapping("detail")
	public String detail() {
		return "docManage/doc_detail";
	}
	
	//문서관리(화면)
	@GetMapping("manage")
	public String manage() {
		return "docManage/doc_manage";
	}
		
	//일반문서 작성
	@PostMapping("write")
	public String write(DocVo dv, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String empNo = loginMember.getEmpNo();
		dv.setEmpNo(empNo);
		int result = ds.write(dv);
		return "docManage/doc_list";
	}
}
