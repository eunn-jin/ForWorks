package com.kh.forworks.docmanage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.kh.forworks.docmanage.vo.DocControlVo;
import com.kh.forworks.docmanage.vo.SignVo;
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
		if((MemberVo)session.getAttribute("loginMember")!=null) {
			MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
			//페이징처리
			int totalCount = ads.selectTotalCnt(loginMember.getEmpNo());
			PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
			//게시글 가져오기
			List<DocControlVo> voList = ads.selectContDocList(pv);
			
			System.out.println(voList);
			
			model.addAttribute("voList",voList);
			model.addAttribute("pv",pv);
			
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

		return "docManage/app_doc_write";
		}else {
			session.setAttribute("toastMsg", "로그인이 필요합니다.");
			return "redirect:/login";
		}
		
	}
	//결재문서 불러오기
	@PostMapping(value="select",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectDocByEmp(HttpSession session, String docDate) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String empNo = loginMember.getEmpNo();
		
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
		List<DocControlVo> result = ads.selectOneDoc(adocNo);
		List<ApprovDocumentVo> file = ads.selectFile(adocNo);
		if(file != null ) {
			for( int i = 0 ; i < file.size(); i++) {
				result.get(i).setFileName(file.get(i).getFileName());
				result.get(i).setChangeFileName(file.get(i).getChangeFileName());
				System.out.println(result.get(i).getFileName() + result.get(i).getChangeFileName());
			}
		}
		System.out.println(result.get(0).getApproveMember());
		System.out.println(result.get(0).getAdocContent());
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
			System.out.println("로그인번호확인 : " + empNo);
			
			//페이징처리
			int totalCount = ads.selectTotalCnt(empNo);
			PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
			//게시글 가져오기
			HashMap map = new HashMap();
			map.put("pv", pv);
			map.put("empNo", empNo);
			List<DocControlVo> voList = ads.selectContDocByEmp(map);
			
			System.out.println("게시글가져오기" + voList);
			
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
		System.out.println(no);
		List<DocControlVo> result = ads.selectOneContDoc(no);
		List<ApprovDocumentVo> file = ads.selectFile(no);
		List<DocControlVo> cont = ads.selectContDetail(no);
		if(file != null ) {
			for( int i = 0 ; i < file.size(); i++) {
				result.get(i).setFileName(file.get(i).getFileName());
				result.get(i).setChangeFileName(file.get(i).getChangeFileName());
				System.out.println(result.get(i).getFileName() + result.get(i).getChangeFileName());
			}
		}
		System.out.println(result);
		System.out.println(cont);
		model.addAttribute("adoc",result);
		model.addAttribute("cont",cont);
		
		return "docManage/app_doc_man_detail";
	}		
	//결재문서관리디테일-게시상태수정
	@PostMapping("manDetail/{no}")
	public String manDetail(@PathVariable String no, DocControlVo vo , HttpSession session) {

		System.out.println(vo.getContStatus());
		vo.setAdocNo(no);
		int result = ads.updateStatus(vo);
		System.out.println(result);
		
		if(result == 0) {
			session.setAttribute("toastMsg", "다시 시도해주세요.");
			return "docManage/app_doc_man_detail";
			
		}else {
			session.setAttribute("toastMsg", "게시상태 변경 완료!");
			return "docManage/app_doc_manage";
		}

	}
	//결재문서리스트디테일(화면)
	@GetMapping("adocDetail/{no}")
	public String adocDetail(@PathVariable String no,Model model) {
		List<DocControlVo> vo = ads.selectContDetail(no);
		List<DocControlVo> vo2 = ads.selectOneDoc(no);
		System.out.println("이건가" + vo2);
		model.addAttribute("vo",vo);
		model.addAttribute("vo2",vo2);
		return "docManage/app_doc_detail";
	}
	
	//화면테스트
	@GetMapping("formtest/{no}")
	public String formtest(Model model, HttpServletRequest req,@PathVariable String no, HttpSession session) {
		List<DocControlVo> vo = ads.selectContDetail(no);
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		String empNo = loginMember.getEmpNo();
		//문서내용 받아오기
		List<DocControlVo> one = ads.selectOneDoc(no);
		System.out.println("이건되나" + one);
		//싸인+부서+직급받아오기
		List<SignVo> sign = ads.selectSign(no);
		System.out.println("싸인,부서,직급" + sign.get(0));
		//작성자 부서,직급,싸인 받아오기
		System.out.println(vo.get(0).getEmpNo());
		SignVo mem = ads.selectMemInfo(empNo);
		System.out.println("작성자정보" + mem);
		//협조자 이름받기
		List<SignVo> coo = ads.selectCooList(no);
		System.out.println("협조"+coo);
		
		System.out.println("vo출" + vo);
		System.out.println("sign출" + sign);
		System.out.println(mem);
		
		req.setAttribute("one", one);
		req.setAttribute("coo", coo);
		req.setAttribute("vo", vo);
		req.setAttribute("mem", mem);
		req.setAttribute("sign", sign);
		
	
		return "docManage/form_test";
	}
	
	
	
	
	
	
	
	
	
}//class
















