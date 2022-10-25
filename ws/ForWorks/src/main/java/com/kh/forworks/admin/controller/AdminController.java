package com.kh.forworks.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.forworks.admin.service.AdminService;
import com.kh.forworks.admin.vo.AdminVo;
import com.kh.forworks.admin.vo.CorpInfoVo;
import com.kh.forworks.member.vo.MemberVo;

@Controller
@RequestMapping("foradmin")
public class AdminController {
	
	private final AdminService adminService;
	
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	//관리자 로그인
	@GetMapping("")
	public String login() {
		return "admin/admin-login";
	}
	
	@PostMapping("login")
	public String login(AdminVo vo, HttpSession session) {
		AdminVo chiefAdmin = adminService.login(vo);
		
		if(chiefAdmin != null) {
			session.setAttribute("chiefAdmin", chiefAdmin);
			return "redirect:/foradmin/main";
		} else {
			session.setAttribute("toastMsg", "로그인 실패");
			return "redirect:/foradmin";
		}
		
	}
	
	//회사정보 설정
	@GetMapping("main")
	public String main() {
		return "admin/admin-main";
	}
	
	//직무,직급 설정
	@GetMapping("pos")
	public String pos() {
		return "admin/admin-position";
	}
	
	//구성원 승인
	@GetMapping("approval")
	public String memberApply(Model model) {
		
		List<MemberVo> applyList = adminService.selectApplyList();
		
		for(int i = 0; i < applyList.size(); i++) {
			String regNo = applyList.get(i).getEmpRegno();
			String phone = applyList.get(i).getEmpPhone();
			
			String changeRegNo = regNo.substring(0,6) + "-" + regNo.substring(6);
			String changePhone = phone.substring(0,3) + "-" + phone.substring(3, 7) + "-" + phone.substring(7);
			
			applyList.get(i).setEmpRegno(changeRegNo);
			applyList.get(i).setEmpPhone(changePhone);
		}
		
		List<CorpInfoVo> posList = adminService.selectPosList();
		List<CorpInfoVo> deptList = adminService.selectDeptList();
		
		model.addAttribute("applyList", applyList);
		model.addAttribute("posList", posList);
		model.addAttribute("deptList", deptList);
		return "admin/admin-memberapprove";
	}
	
	@PostMapping("memberApprove")
	public String memberApprove(MemberVo vo, HttpSession session) {
		
		System.out.println(vo);
		int result = adminService.memberApprove(vo);
		
		if(result == 1) {
			session.setAttribute("toastMsg", "구성원 등록 완료!");
		} else {
			session.setAttribute("toastMsg", "구성원 등록 실패.. 관리자에게 문의하세요");
		}
		return "redirect:/foradmin/approval";
	}
	
	@PostMapping("deleteApply")
	@ResponseBody
	public String deleteApply(String empNo) {
		int result = adminService.deleteApply(empNo);
		
		return "" + result;
	}
	
		
	//구성원 조회
	@GetMapping("member")
	public String memberList() {
		return "admin/admin-memberlist";
	}
	
	//운영자 설정
	@GetMapping("oper")
	public String oper() {
		return "admin/admin-operator";
	}
}
