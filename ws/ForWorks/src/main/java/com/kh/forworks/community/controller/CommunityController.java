package com.kh.forworks.community.controller;

import java.io.File;
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

import com.kh.forworks.FileUploader;
import com.kh.forworks.PageVo;
import com.kh.forworks.Pagination;
import com.kh.forworks.community.service.CommunityService;
import com.kh.forworks.community.vo.CommunityVo;
import com.kh.forworks.communityattachments.vo.CommunityAttachmentsVo;
import com.kh.forworks.notice.vo.NoticeVo;
import com.kh.forworks.noticeattachments.vo.NoticeAttachmentsVo;

@Controller
@RequestMapping("community")
public class CommunityController {
	
	private final CommunityService cmusv;

	@Autowired
	public CommunityController(CommunityService cmusv) {
		this.cmusv = cmusv;
	}

		//커뮤니티 (화면)
		@GetMapping("list/{pno}")
		public String list(Model model, @PathVariable int pno){
			
			//전체
			//커뮤니티 전체 갯수
			int totalCount = cmusv.selectTotalCount();
			//페이징 처리
			PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
			//커뮤니티 리스트 가져오기
			List<CommunityVo> cmuList = cmusv.selectList(pv);
			//System.out.println(cmuList);
			
			//로그인한 사원의 부서에 대해서만
			//커뮤니티 개수(해당부서)
			int ttCntDp = cmusv.selectDp();
			PageVo pvdp = Pagination.getPageVo(ttCntDp, pno, 5, 10);
			List<CommunityVo> cmudpList = cmusv.selectListdp(pvdp);
			
			if (cmuList != null && cmudpList != null) {
				model.addAttribute("cmuList",cmuList);
				model.addAttribute("pv", pv);
				
				model.addAttribute("cmudpList",cmudpList);
				model.addAttribute("pvdp",pvdp);
				
				return "community/list";
			}else {
				return "error";
			}
			
		}
		
		@GetMapping("write")
		public String write() {
			return"community/write";
		}
		
		
		//커뮤니티 게시글 작성
		@PostMapping("write")
		public String write(CommunityVo cmuvo, CommunityAttachmentsVo cmatVo ,HttpServletRequest req,Model model ,HttpSession session) {
			System.out.println("커뮤::"+cmuvo);
			
			cmuvo.setEmpNo("1");
			
			//파일 유무 확인
			if (cmuvo.getCmuFileName() != null && !cmuvo.getCmuFileName().isEmpty()) {
				//파일 있음
				//파일 업로드 후 저장된 파일명 얻기 
				String savePath = req.getServletContext().getRealPath("/resources/upload/commu/");
				String changeName = FileUploader.fileUpload(cmuvo.getCmuFileName(), savePath);
				String originName = cmuvo.getCmuFileName().getOriginalFilename();
				cmatVo.setCmatChange(changeName);
				cmatVo.setCmatOrigin(originName);
				cmatVo.setCmatPath(savePath);
				System.out.println("공지파일::"+cmatVo);
			}else {cmatVo=null;}
			
			if (cmatVo != null) {
				System.out.println("파일있음");
			}
			
			//db 공지사항 저장
			int result = cmusv.insertCommu(cmuvo, cmatVo);
			
			
			if (result == 1 || result ==2) {
				// 1 :: 파일 없음  || 2 :: 파일있음
				session.setAttribute("alertMsg", "커뮤니티 작성 성공!");
				return "redirect:/community/list/1";
			}else {
				model.addAttribute("errorMsg","커뮤니티 작성 실패..");
				return "redirect:/error";
				}
		}
		
		//커뮤니티 게시글 상세보기
		@GetMapping("detail/{no}")
		public String detail(@PathVariable String no, Model model){
			
			//db 공지사항 조회
			CommunityVo cmuvo  = cmusv.selectOne(no);
			System.out.println("커뮤 확인::"+cmuvo);
			//첨부파일 확인
			CommunityAttachmentsVo cmatVo = cmusv.checkFile(no);
			System.out.println("파일 확인::"+cmatVo);
			
			model.addAttribute("cmuvo", cmuvo);
			model.addAttribute("cmatVo", cmatVo);
			//System.out.println(ntvo);
			return"community/detail";
		}
		
		//커뮤니티 게시글 수정(화면)
		@GetMapping("update/{no}")
		public String update(@PathVariable String no, Model model) {
			//db 공지사항 조회
			CommunityVo cmuvo  = cmusv.selectOne(no);
			System.out.println(cmusv);
			
			//첨부파일 확인
			CommunityAttachmentsVo cmatVo = cmusv.checkFile(no);
			System.out.println("파일 확인::"+cmatVo);
			
			model.addAttribute("cmuvo", cmuvo);
			model.addAttribute("cmatVo", cmatVo);
			return"community/update";
		}
		
		//게시글 수정
		@PostMapping("update/{no}")
		public String update(@PathVariable String no, CommunityVo cmuvo, CommunityAttachmentsVo cmatVo, HttpServletRequest req, Model model, HttpSession session) {
			cmuvo.setCmuNo(no);
			cmatVo.setCmatNo(no);
			//System.out.println(ntvo);
			//System.out.println(ntatVo);
			
			//정보수정
			
			//기존 파일 삭제
			String savePath = req.getServletContext().getRealPath("/resources/upload/notice/");
			//MemberVo loginMember = (MemberVo)(session.getAttribute("loginMember"));
			
			//첨부파일 확인
			cmatVo = cmusv.checkFile(no);
			//System.out.println("파일 확인(정보수정post)::"+ntatVo);
			
			String fileName = cmatVo.getCmatOrigin();
			File f =  new File(savePath +  fileName);
			if(f.exists()) { //파일 존재하는지 확인
				f.delete();
			}
			
			//파일 유무 확인
			if (cmuvo.getCmuFileName() != null && !cmuvo.getCmuFileName().isEmpty()) {
				//파일 있음
				//파일 업로드 후 저장된 파일명 얻기 
				String changeName = FileUploader.fileUpload(cmuvo.getCmuFileName(), savePath);
				String originName = cmuvo.getCmuFileName().getOriginalFilename();
				cmatVo.setCmatChange(changeName);
				cmatVo.setCmatOrigin(originName);
				cmatVo.setCmatPath(savePath);
				//System.out.println("공지파일::"+ntatVo);
			}else {cmatVo=null;}
			
			int result = cmusv.edit(cmuvo, cmatVo, no);
			if (result==1 || result ==2) {
				session.setAttribute("alertMsg", "커뮤글 수정 성공!");
				return "redirect:/community/list/"+no;
				
			}else {return"redirect:/error";}
		}
		
		@GetMapping("delete/{no}")
		public String delete(@PathVariable String no, Model model, HttpSession session) {
			
			int result = cmusv.delete(no);
			
			if (result ==1) {
				session.setAttribute("alertMsg", "공지사항 삭제 성공!");
				return "redirect:/community/list/1";
			}else {return"redirect:/error";}
		}
}
