package com.kh.forworks.docmanage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.docmanage.service.AppDocmanageService;
import com.kh.forworks.member.vo.MemberVo;

@Controller
@RequestMapping("appmanage")
public class AppDocmanageController {
	
	private AppDocmanageService ads;
	
	@Autowired
	public AppDocmanageController(AppDocmanageService ads) {
		this.ads = ads;
	}
	
	//결재문서리스트(화면)
	
	@GetMapping("list")
	public String list(HttpSession session) {
		if((MemberVo)session.getAttribute("loginMember")!=null) {
			return "docManage/app_doc_list";			
		}else {
			session.setAttribute("toastMsg", "로그인이 필요합니다.");
			return "redirect:/login";
		}
	}
	
	//결재문서등록(화면)
	@GetMapping("write")
	public String write(Model model, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		if(loginMember != null) {
		//부서 가져오기
		List<MemberVo> dept = ads.selectDept();
		model.addAttribute("dept",dept);
			
		String empNo = loginMember.getEmpNo();
		//작성한 전자결재문서리스트 받아오기
		List<ApprovDocumentVo> adv = ads.selectDocByEmp(empNo);
	
		return "docManage/app_doc_write";
		}else {
			session.setAttribute("toastMsg", "로그인이 필요합니다.");
			return "redirect:/login";
		}
		
	}
	
}
















