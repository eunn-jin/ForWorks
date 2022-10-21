package com.kh.forworks.notice.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forworks.FileUploader;
import com.kh.forworks.PageVo;
import com.kh.forworks.Pagination;
import com.kh.forworks.notice.service.NoticeService;
import com.kh.forworks.notice.vo.NoticeVo;
import com.kh.forworks.noticeattachments.vo.NoticeAttachmentsVo;

@Controller
@RequestMapping("notice")
public class NoticeController {
	
	private final NoticeService nts;
	
	@Autowired
	public NoticeController(NoticeService nts) {
		this.nts = nts;
	}

	//공지사항 (화면)
	@GetMapping("list/{pno}")
	public String list(Model model,@PathVariable int pno){
		
		//공지사항 전체 갯수
		int totalCount = nts.selectTotalCount();
		
		//페이징 처리
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		//공지사항 리스트 가져오기
		List<NoticeVo> ntList = nts.selectList(pv);
		
		
		if (ntList != null) {
			model.addAttribute("ntList",ntList);
			model.addAttribute("pv", pv);
			return "notice/list";
		}else {
			return "error";
		}
		
	}
	
	//공지사항 작성(화면)
	@GetMapping("write")
	public String write() {
		return"notice/write";
	}
	
	//공지사항 작성
	@PostMapping("write")
	public String write(NoticeVo ntvo, NoticeAttachmentsVo ntatVo ,HttpServletRequest req) {
		System.out.println("공지::"+ntvo);
		
		ntvo.setEmpNo("1");
		
		//파일 유무 확인
		if (ntvo.getNtFileName() != null && !ntvo.getNtFileName().isEmpty()) {
			//파일 있음
			//파일 업로드 후 저장된 파일명 얻기 
			String savePath = req.getServletContext().getRealPath("/resources/upload/notice/");
			String changeName = FileUploader.fileUpload(ntvo.getNtFileName(), savePath);
			String originName = ntvo.getNtFileName().getOriginalFilename();
			ntatVo.setNtatChange(changeName);
			ntatVo.setNtatOrigin(originName);
			ntatVo.setNtatPath(savePath);
			System.out.println("공지파일::"+ntatVo);
		}else {ntatVo=null;}
		
		if (ntatVo != null) {
			System.out.println("파일있음");
		}
		
		//db 공지사항 저장
		int result = nts.insertNotice(ntvo, ntatVo);
		
		
		if (result == 1 || result ==2) {
			// 1 :: 파일 없음  || 2 :: 파일있음
			return "redirect:/notice/list/1";
		}else {return "redirect:/error";}
	}
	
	//공지사항 상세보기
	@GetMapping("detail/{no}")
	public String detail(@PathVariable String no, Model model) {
		
		//db 공지사항 조회
		NoticeVo ntvo = nts.selectOne(no);
		
		//첨부파일 확인
		NoticeAttachmentsVo ntatVo = nts.checkFile(no);
		//System.out.println("파일 확인::"+ntatVo);
		
		model.addAttribute("ntvo", ntvo);
		model.addAttribute("ntatVo", ntatVo);
		//System.out.println(ntvo);
		
		return"notice/detail";
	}
	
	//공지사항 수정(화면)
	@GetMapping("update/{no}")
	public String update(@PathVariable String no, Model model) {
		//db 공지사항 조회
		NoticeVo ntvo = nts.selectOne(no);
		
		//첨부파일 확인
		NoticeAttachmentsVo ntatVo = nts.checkFile(no);
		System.out.println("파일 확인::"+ntatVo);
		
		model.addAttribute("ntvo", ntvo);
		model.addAttribute("ntatVo", ntatVo);
		return"notice/update";
	}
	
	//공지사항 수정
	@PostMapping("update/{no}")
	public String update(@PathVariable String no, NoticeVo ntvo, NoticeAttachmentsVo ntatVo, HttpServletRequest req) {
		ntvo.setNtno(no);
		ntatVo.setNtno(no);
		System.out.println(ntvo);
		System.out.println(ntatVo);
		
		//정보수정
		
		//기존 파일 삭제
		String savePath = req.getServletContext().getRealPath("/resources/upload/notice/");
		//MemberVo loginMember = (MemberVo)(session.getAttribute("loginMember"));
		
		//첨부파일 확인
		ntatVo = nts.checkFile(no);
		System.out.println("파일 확인(정보수정post)::"+ntatVo);
		
		String fileName = ntatVo.getNtatOrigin();
		File f =  new File(savePath +  fileName);
		if(f.exists()) { //파일 존재하는지 확인
			f.delete();
		}
		
		//파일 유무 확인
		if (ntvo.getNtFileName() != null && !ntvo.getNtFileName().isEmpty()) {
			//파일 있음
			//파일 업로드 후 저장된 파일명 얻기 
			String changeName = FileUploader.fileUpload(ntvo.getNtFileName(), savePath);
			String originName = ntvo.getNtFileName().getOriginalFilename();
			ntatVo.setNtatChange(changeName);
			ntatVo.setNtatOrigin(originName);
			ntatVo.setNtatPath(savePath);
			System.out.println("공지파일::"+ntatVo);
		}else {ntatVo=null;}
		
		//공지사항 정보수정
		int result = nts.edit(ntvo, ntatVo, no);
		
		return "redirect:/notice/detail/"+no;
	}
	
	//공지사항 삭제
	@GetMapping("delete/{no}")
	public String delete(@PathVariable String no) {
		return"redirect:/";
	}
}
