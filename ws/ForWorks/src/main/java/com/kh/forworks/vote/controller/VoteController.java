package com.kh.forworks.vote.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.kh.forworks.community.vo.CommunityVo;
import com.kh.forworks.department.vo.DepartmentVo;
import com.kh.forworks.member.vo.MemberVo;
import com.kh.forworks.vote.service.VoteService;
import com.kh.forworks.vote.vo.VoteAttachmentsVo;
import com.kh.forworks.vote.vo.VoteCategoryVo;
import com.kh.forworks.vote.vo.VoteParticipationVo;
import com.kh.forworks.vote.vo.VoteVo;

@Controller
@RequestMapping("vote")
public class VoteController {
	
	private final VoteService vtsv;
	
	@Autowired
	public VoteController(VoteService vtsv) {
		this.vtsv = vtsv;
	}

	// 투표 리스트
	@GetMapping("list/{pno}")
	public String vote(@PathVariable int pno ,HttpSession session, Model model) {
		
		//투표 리스트, 페이징,로그인여부
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		if (loginMember == null) {
			session.setAttribute("toastMsg", "로그인이 필요합니다.");
			return "redirect:/login";
		}else{

			//전체
			// 전체 투표 갯수
			int totalCount = vtsv.selectTotalCount();
			//페이징 처리
			PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
			//투표 리스트 가져오기
			List<VoteVo> vtList = vtsv.selectList(pv);
			
			//진행중 투표
			int ingCnt = vtsv.selecting();
			PageVo pving = Pagination.getPageVo(ingCnt, pno, 5, 10);
			//리스트 vtList의 상태값이 i인것만
			List<VoteVo> vtingList = vtsv.selectListing(pving);
			
			//마감된 투표
			int endCnt = vtsv.selectEnd();
			PageVo pvend = Pagination.getPageVo(endCnt, pno, 5, 10);
			//리스트 vtList의 상태값이 e인것만
			List<VoteVo> vtEndList = vtsv.selectListEnd(pvend);

			
			if (vtList != null) {
				//all
				model.addAttribute("vtList",vtList);
				model.addAttribute("pv", pv);
				//ing
				model.addAttribute("vtingList", vtingList);
				model.addAttribute("pving", pving);
				
				//end
				model.addAttribute("vtEndList", vtEndList);
				model.addAttribute("pvend", pvend);
				
//				System.out.println(vtList);
//				System.out.println(pv);
//				System.out.println("--------------");
//				System.out.println(vtingList);
//				System.out.println(pving);
//				System.out.println("--------------");
//				System.out.println(vtEndList);
//				System.out.println(pvend);
				return "vote/list";
			}else {
				return "error";
			}
		}
	}
	
	//투표 생성(화면)
	@GetMapping("create")
	public String create(HttpSession session, Model model) {
		
		//로그인정보 :: 버튼이 생성자일때만 보이므로 가져오는것x

		//부서목록 가져오기
		List<DepartmentVo> dpvo = vtsv.selectAlldp();
		//System.out.println(dpvo);
		
		model.addAttribute("dpvo", dpvo);
		return "vote/create";
	}
	
	//투표 생성
	@PostMapping("create")
	public String create(VoteVo vtvo ,VoteCategoryVo vtcg, VoteParticipationVo vtpt, VoteAttachmentsVo vtatVo, HttpSession session, HttpServletRequest req) {
		
		System.out.println(vtvo);
		System.out.println(vtcg);
		System.out.println(vtpt);
		System.out.println(vtatVo);
		
		System.out.println(vtcg.getVtcgName());
		//질문 항목 문자열 자르기및 배열에 담기		
		String[] vtcgArr =vtcg.getVtcgName().split(",");
		System.out.println(vtcgArr.length);
		
		
		//회원정보 set
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		vtvo.setEmpNo(loginMember.getEmpNo()); //투표 vo에 로그인회원 번호 대입
		
		//파일 유무 확인
		//파일 유무 확인
		if (vtvo.getVtFile() != null && !vtvo.getVtFile().isEmpty()) {
			//파일 있음
			//파일 업로드 후 저장된 파일명 얻기 
			String savePath = req.getServletContext().getRealPath("/resources/upload/vote/");
			String changeName = FileUploader.fileUpload(vtvo.getVtFile(), savePath);
			String originName = vtvo.getVtFile().getOriginalFilename();
			vtatVo.setVtatChange(changeName);
			vtatVo.setVtatOrigin(originName);
			vtatVo.setVtatPath(savePath);
			
		}else {vtatVo=null;}
		
		//대상자가 전체 all 인가?  특정부서별 dp 인가 확인후 
		
		
		//투표, 투표항목, 투표대상자, 투표파일 insert
		int result = vtsv.insertVote(vtvo, vtcgArr, vtatVo);
		
		if (result == 1) {
			return "redirect:/list/1";
		}else {return "error";}
	}
	
	//투표 상세보기(생성자)
	@GetMapping("detailCreator/{pno}")
	public String deatilCreator(@PathVariable String pno, Model model, HttpSession session) {

		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		//번호에 맞는 투표 정보 가져오기
		//VoteVo vtvo = vtsv.selectOneVt(pno);
		
		//번호에 맞는 항목들 가져오기
		
		
		//투표 대상자 가져오기
		
		return "vote/detailCreator";
	}
	
	//투표 상세보기(사용자)
		@GetMapping("detailUser/{pno}")
		public String detaiUser() {
			return "vote/detailUser";
		}

}
