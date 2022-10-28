package com.kh.forworks.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.forworks.member.service.MemberService;
import com.kh.forworks.member.vo.MemberVo;

@Controller
public class MemberController {
	
	private final MemberService memberService;
	
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	//회원가입
	@GetMapping("join")
	public String join() {
		return "member/join";
	}
	
	@PostMapping("join")
	public String join(MemberVo vo, HttpSession session) {
		String regno = vo.getEmpRegno1() + vo.getEmpRegno2();
		vo.setEmpRegno(regno);
		
		int result = memberService.memberJoin(vo);
		
		if(result == 1) {
			session.setAttribute("toastMsg", "가입신청 완료! 승인 대기중입니다");
			return "redirect:/login";
		} else {
			session.setAttribute("toastMsg", "회원가입 실패");
			return "redirect:/join";
		}
	}
	
	//아이디 중복확인
	@PostMapping("idCheck")
	@ResponseBody
	public String idCheck(String empId) {
		int result = memberService.idCheck(empId);
		return "" + result;
	}
	
	//로그인
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("login")
	public String login(MemberVo vo, String saveId, HttpServletResponse resp, HttpSession session) {
		if(saveId != null) {
			Cookie idCookie = new Cookie("mid", vo.getEmpId());
			resp.addCookie(idCookie);
		}
		
		MemberVo loginMember = memberService.memberLogin(vo);
		
		if(loginMember != null) {
			if("Y".equals(loginMember.getEmpStatus())) {
				//주민번호 처리
				String exRegNo = loginMember.getEmpRegno();
				String regNo = exRegNo.substring(0, 6) + "-*******";
				loginMember.setEmpRegno(regNo);
	
				session.setAttribute("loginMember", loginMember);
				return "redirect:/";
			} else {
				session.setAttribute("toastMsg", "이용할 수 없는 계정입니다.");
				return "redirect:/login";
			}
		} else {
			session.setAttribute("toastMsg", "로그인 실패");
			return "redirect:/login";
		}
	}
	
	//아이디 찾기
	@PostMapping("findId")
	@ResponseBody
	public String findId(String empName, String empEmail) {
		MemberVo vo = new MemberVo();
		vo.setEmpName(empName);
		vo.setEmpEmail(empEmail);
		
		String foundId = memberService.findMemberId(vo);
		return foundId;
	}
	
	//비밀번호 찾기 - 조회 / 변경
	@PostMapping("findMember")
	@ResponseBody
	public String findMember(String empId, String empName, String empEmail) {
		MemberVo vo = new MemberVo();
		vo.setEmpId(empId);
		vo.setEmpName(empName);
		vo.setEmpEmail(empEmail);
		
		return "";
	}
	
	//로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	//마이페이지
	@GetMapping("mypage")
	public String mypage() {
		return "member/mypage-main";
	}
	
	@PostMapping("mypage")
	public String mypage(MemberVo vo, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		vo.setEmpNo(loginMember.getEmpNo());
		
		int result = memberService.memberInfoEdit(vo);
		
		if(result == 1) {
			session.setAttribute("toastMsg", "정보변경 성공!");
			loginMember.setEmpEmail(vo.getEmpEmail());
			loginMember.setEmpPhone(vo.getEmpPhone());
			loginMember.setEmpAddr1(vo.getEmpAddr1());
			loginMember.setEmpAddr2(vo.getEmpAddr2());
			loginMember.setEmpAddr3(vo.getEmpAddr3());
		}
		return "redirect:/mypage";
	}
	
	//비밀번호 변경
	@PostMapping("changePwd")
	@ResponseBody
	public String changePwd(String nowPwd, String changePwd, HttpSession session) {
		String empId = ((MemberVo)session.getAttribute("loginMember")).getEmpId();
		MemberVo vo = new MemberVo();
		vo.setEmpId(empId);
		vo.setEmpPwd(changePwd);
		vo.setNowPwd(nowPwd);
		
		int result = memberService.changePwd(vo);
		return "" + result;
	}
	
	//프로필사진 변경
	
	
	//마이페이지 급여계좌설정
	@GetMapping("mypage/account")
	public String mypageAccount() {
		return "member/mypage-account";
	}
	
	@PostMapping("mypage/account")
	public String mypageAccount(MemberVo vo, HttpSession session) {
		if(vo.getEmpBank() == null) {
			return "redirect:/mypage/account";
		}
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		vo.setEmpNo(loginMember.getEmpNo());
		
		int result = memberService.memberAccountEdit(vo);
		
		if(result == 1) {
			session.setAttribute("toastMsg", "계좌 변경 성공!");
			loginMember.setEmpBank(vo.getEmpBank());
			loginMember.setEmpAccount(vo.getEmpAccount());
		}
		return "redirect:/mypage/account";
	}
}
