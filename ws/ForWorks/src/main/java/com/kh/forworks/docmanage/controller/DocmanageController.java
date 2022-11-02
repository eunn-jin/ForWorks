package com.kh.forworks.docmanage.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.forworks.approv.vo.DocFileVo;
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
	public String write(DocVo dv, HttpSession session , HttpServletRequest req) {
		//로그인 정보 받아오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String empNo = loginMember.getEmpNo();
		dv.setEmpNo(empNo);
		
		
		/*
		 * MultipartFile[] fArr = dv.getFile();
		 * 
		 * //파일저장 //파일 있는지 확인 if(!fArr[0].isEmpty()) {
		 * 
		 * for(int i = 0 ; i <fArr.length; i++) {
		 * 
		 * 
		 * MultipartFile f = fArr[i];
		 * 
		 * //원본파일명 String originName = f.getOriginalFilename(); String ext =
		 * originName.substring(originName.lastIndexOf("."));
		 * 
		 * //변경된 파일명 long now = System.currentTimeMillis(); String changeFileName = now
		 * + "_" + originName;
		 * 
		 * 
		 * //저장할 경로파일 객체 생성 String rootpath =
		 * req.getServletContext().getRealPath("/resources/doc-file/uploadFile/"); File
		 * targetFile = new File(rootpath + changeFileName + ext);
		 * 
		 * //저장 try { f.transferTo(targetFile); } catch (Exception e) {
		 * e.printStackTrace(); }
		 * 
		 * } }
		 */

		int result = ds.write(dv);
		return "docManage/doc_list";
	}
}
