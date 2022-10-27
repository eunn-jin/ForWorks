package com.kh.forworks.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.forworks.PageVo;
import com.kh.forworks.Pagination;
import com.kh.forworks.address.vo.AddressVo;
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
		
	//구성원 조회, 정렬, 검색
	@GetMapping("member/{pno}")
	public String memberList(Model model, @PathVariable int pno,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "sort", required = false) String sort,
			@RequestParam(value = "order", required = false) String order
			) {
		
		AddressVo addVo = new AddressVo();
		addVo.setSort(sort);
		addVo.setOrder(order);
		addVo.setKeyword(keyword);
		
		int totalCount = adminService.selectListCnt(addVo);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 1, 10);
		
		List<MemberVo> memberList = adminService.memberList(pv, addVo);
		
		model.addAttribute("pv", pv);
		model.addAttribute("addressParam", addVo);
		model.addAttribute("memberList", memberList);
		
		return "admin/admin-memberlist";
	}
	
	//운영자 설정
	@GetMapping("oper")
	public String oper() {
		return "admin/admin-operator";
	}
}
