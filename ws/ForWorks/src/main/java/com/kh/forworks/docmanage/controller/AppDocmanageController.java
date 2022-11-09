package com.kh.forworks.docmanage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.forworks.PageVo;
import com.kh.forworks.Pagination;
import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.docmanage.service.AppDocmanageService;
import com.kh.forworks.docmanage.vo.DfileVo;
import com.kh.forworks.docmanage.vo.DocControlVo;
import com.kh.forworks.docmanage.vo.DocVo;
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
	
	@GetMapping("list/{pno}")
	public String list(@PathVariable int pno,HttpSession session, Model model) {
//		if((MemberVo)session.getAttribute("loginMember")!=null) {
//			return "docManage/app_doc_list";			
//		}else {
//			session.setAttribute("toastMsg", "로그인이 필요합니다.");
//			return "redirect:/login";
//		}
		String empNo = "1";
		//페이징처리
		int totalCount = ads.selectTotalCnt(empNo);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		//게시글 가져오기
		List<DocControlVo> voList = ads.selectContDocList(pv);
		
		System.out.println(voList);
		
		model.addAttribute("voList",voList);
		model.addAttribute("pv",pv);
		
		return "docManage/app_doc_list";
	}
	
	//결재문서등록(화면)
	@GetMapping("write")
	public String write(Model model, HttpSession session) {
//		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
//		if(loginMember != null) {
//		//부서 가져오기
//		List<MemberVo> dept = ads.selectDept();
//		model.addAttribute("dept",dept);
//
//		return "docManage/app_doc_write";
//		}else {
//			session.setAttribute("toastMsg", "로그인이 필요합니다.");
//			return "redirect:/login";
//		}
		List<MemberVo> dept = ads.selectDept();
		model.addAttribute("dept",dept);

		return "docManage/app_doc_write";
		
	}
	//결재문서 불러오기
	@PostMapping(value="select",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectDocByEmp(HttpSession session, String docDate) {
//		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
//		String empNo = loginMember.getEmpNo();
		String empNo  = "1";
		HashMap map = new HashMap();
		map.put("empNo", empNo);
		map.put("docDate", docDate);
		
		List<ApprovDocumentVo> vo = ads.selectDocByEmp(map);
		System.out.println(vo);
		Gson g = new Gson();
		return g.toJson(vo);
	}
	@PostMapping(value="selectOne",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectOne(String adocNo) {
		System.out.println(adocNo);
		ApprovDocumentVo result = ads.selectOneDoc(adocNo);
		System.out.println(result);
		Gson g = new Gson();
		return g.toJson(result);
	}
	
	//결재문서등록(폼)
	@PostMapping("write")
	public String write(DocControlVo vo , HttpSession session) {
		String range3="";
		String[] range2 = vo.getRange_();
		if(range2 != null) {
			for(int i = 0 ; i < range2.length;i++) {
				range3+=range2[i]+",";
				vo.setRange(range3);
			}
		}
		int result = ads.insertDocCont(vo);
		if(result == 1) {
			session.setAttribute("toastMsg", "등록성공");
			return "docManage/app_doc_list";
		}else {
			session.setAttribute("toastMsg", "다시시고");
			return "docManage/app_doc_write";
		}
		
	}
	//결재문서관리리스트(화면)
	@GetMapping("manage/{pno}")
	public String manage(Model model , @PathVariable int pno , HttpSession session) {
		//로그인 데이터 가져오기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		if(loginMember != null) {
			String empNo = loginMember.getEmpNo();
			System.out.println(empNo);
			
			//페이징처리
			int totalCount = ads.selectTotalCnt(empNo);
			PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
			//게시글 가져오기
			HashMap map = new HashMap();
			map.put("pv", pv);
			map.put("empNo", empNo);
			List<DocControlVo> voList = ads.selectContDocByEmp(map);
			
			System.out.println(voList);
			
			model.addAttribute("voList",voList);
			model.addAttribute("pv",pv);
			
			return "docManage/app_doc_manage";		
		}else {
			session.setAttribute("toastMsg", "로그인 정보가 필요합니다.");
			return "redirect:/login";
		}
		
	}
	//결재문서관리디테일-화면
	@GetMapping("manDetail/{no}")
	public String manDetail(@PathVariable String no , Model model) {
		DocControlVo vo = ads.selectContDetail(no);

//		if(vo.getFileNo() != null) {
//			DfileVo fv = ads.selectFileDoc(no);
//			fv.setExt(fv.getOriginName().substring(fv.getOriginName().lastIndexOf('.')));
//			model.addAttribute("fv",fv);
//			System.out.println("디테일조회fv " + fv);
//		}
		System.out.println(vo);
		model.addAttribute("vo",vo);
		return "docManage/app_doc_man_detail";
	}		
	//결재문서관리디테일-게시상태수정
	@PostMapping("manDetail/{no}")
	public String manDetail(@PathVariable String no, DocControlVo vo , HttpSession session) {

		System.out.println(vo.getContStatus());
		vo.setAdocNo(no);
		int result = ads.updateStatus(vo);
		System.out.println(result);
		
		if(result == 1) {
			session.setAttribute("toastMsg", "게시상태 변경 완료!");
			return "docManage/app_doc_manage";
		}else {
			session.setAttribute("toastMsg", "보존기간을 확인해주세요.");
			return "docManage/app_doc_man_detail";
		}

	}
	
	
	
	
	
	
	
	
	
	
	
}//class
















