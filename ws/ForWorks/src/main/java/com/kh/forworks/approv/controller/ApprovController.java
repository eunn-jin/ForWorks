package com.kh.forworks.approv.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forworks.FileUploader;
import com.kh.forworks.approv.service.ApprovService;
import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.approv.vo.DocFormVo;
import com.kh.forworks.approv.vo.DocSignVo;
import com.kh.forworks.member.vo.MemberVo;

@Controller
@RequestMapping("approv")
public class ApprovController {
	
	private final ApprovService service;
	
	@Autowired
	public ApprovController(ApprovService service) {
		this.service = service;
	}

	@GetMapping("main")
	public String main(HttpSession session) {
		
		String empNo = (String) session.getAttribute("empNo");
		
		List<ApprovDocumentVo> approvList = service.selectApprovList(empNo);
		List<ApprovDocumentVo> coopList = service.selectCoopList(empNo);
		List<ApprovDocumentVo> referList = service.selectReferList(empNo);
		
		return "approv/approv-main";
	}
	
	@GetMapping("create")
	public String create(HttpServletRequest req, HttpSession session) {
		
		if(session.getAttribute("loginMember")==null) {
			return "redirect:/login";
		}
		
		List<MemberVo> approvMemberList = service.selectMemberList();
		req.setAttribute("MemberList", approvMemberList);
		
		return "approv/approv-create";
	}
	
	@PostMapping("create")
	public String create(ApprovDocumentVo vo, HttpSession session, HttpServletRequest req) {
		
		if(vo.getDocFile()!=null && !vo.getDocFile().isEmpty()) {
			String savePath = req.getServletContext().getRealPath("/resources/upload/profile/");
			vo.setFileName(vo.getDocFile().getOriginalFilename());
			
			String changeName = FileUploader.fileUpload(vo.getDocFile(), savePath); 
			
			vo.setChangeFileName(changeName);
		}
		
		int result = service.insertApprovDoc(vo);
		
		if(result==1) {
			return "redirect:/approv/main";
		}else {
			return "redirect:/";
		}
		
	}
	
	@GetMapping("detail")
	public String detail() {
		return "approv/approv-detail";
	}
	
	@PostMapping("detail/{dno}")
	public String detail(@PathVariable String dno) {
		
		int result = service.updateApprov(dno);
		
		if(result==1) {
			return "redirect:/approv/main";
		}else {
			return "redirect:/";
		}
	}
	
	@GetMapping("coop")
	public String coop() {
		return "approv/coop-detail";
	}
	
	@GetMapping("refer")
	public String refer() {
		return "approv/refer-detail";
	}
	
	@GetMapping("form/create")
	public String createForm() {
		return "approv/form-create";
	}
	
	@GetMapping("form/main")
	public String mainForm() {
		List<DocFormVo> formList = service.selectFormList();
		return "approv/form-main";
	}
	
	@GetMapping("form/detail")
	public String detailForm() {
		return "approv/form-detail";
	}
	
	@GetMapping("form/edit")
	public String editForm() {
		return "approv/form-edit";
	}
	
	@GetMapping("sign/create")
	public String createSign() {
		return "approv/sign-create";
	}
	
	@PostMapping("sign/create")
	public String createSign(DocSignVo vo, HttpServletRequest req) {
		if(vo.getSignFile()!=null && !vo.getSignFile().isEmpty()) {
			
			String savePath = req.getServletContext().getRealPath("/resources/upload/profile/");
			vo.setSignOrigin(vo.getSignFile().getOriginalFilename());
			
			String changeName = FileUploader.fileUpload(vo.getSignFile(), savePath); 
			
			vo.setSignEdit(changeName);
		}
		
		return "approv/sign-create";
	}
	
	@GetMapping("sign/edit")
	public String editSign() {
		return "approv/sign-edit";
	}
	
	
}
