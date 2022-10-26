package com.kh.forworks.address.controller;

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
import com.kh.forworks.address.service.AddressService;
import com.kh.forworks.address.vo.AddressVo;
import com.kh.forworks.admin.service.AdminService;
import com.kh.forworks.admin.vo.CorpInfoVo;
import com.kh.forworks.member.vo.MemberVo;

@Controller
@RequestMapping("address")
public class AddressController {
	
	private final AddressService addressService;
	
	private final AdminService adminService;
	
	public AddressController(AddressService addressService, AdminService adminService) {
		this.addressService = addressService;
		this.adminService = adminService;
	}
	
	//상태등록
	@PostMapping("status")
	@ResponseBody
	public String status(String statNo, HttpSession session) {
		String empNo = ((MemberVo)session.getAttribute("loginMember")).getEmpNo();
		
		MemberVo vo = new MemberVo();
		vo.setEmpNo(empNo);
		vo.setStatNo(statNo);
		
		int result = addressService.updateStatus(vo);
		
		return "" + result;
	}
	
	//즐겨찾기 등록/삭제
	@PostMapping("favorite/{stat}")
	@ResponseBody
	public String favorite(String bmEmpNo, @PathVariable String stat, HttpSession session) {
		String empNo = ((MemberVo)session.getAttribute("loginMember")).getEmpNo();
		
		MemberVo vo = new MemberVo();
		vo.setEmpNo(empNo);
		vo.setBmEmpNo(bmEmpNo);
		
		System.out.println(vo);
		
		int result = addressService.editFavoriteMember(vo, stat);
		
		return "" + result;
	}
	
	// 조직/중요/부서 주소록 조회, 정렬(이름), 검색
	@GetMapping(value = {"/{pno}", "/{nav}/{pno}", "/{nav}/{dept}/{pno}"})
	public String List(Model model, @PathVariable int pno, HttpSession session, 
			@PathVariable(required = false) String nav,
			@PathVariable(required = false) String dept,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "sort", required = false) String sort,
			@RequestParam(value = "order", required = false) String order
			) {
		
		if(nav != null && nav.equals("dept")) {
			if(dept == null) {
				dept = ((MemberVo)session.getAttribute("loginMember")).getDeptNo();
			}
			List<CorpInfoVo> deptList = adminService.selectDeptList();
			String deptName = deptList.get(Integer.parseInt(dept)-1).getDeptName();
			model.addAttribute("deptList", deptList);
			model.addAttribute("deptName", deptName);
		}
		
		AddressVo addVo = new AddressVo();
		addVo.setNav(nav);
		addVo.setDeptNo(dept);
		addVo.setSort(sort);
		addVo.setOrder(order);
		addVo.setKeyword(keyword);
		
		if(nav != null && nav.equals("important")) {
			String empNo = ((MemberVo)session.getAttribute("loginMember")).getEmpNo();
			addVo.setEmpNo(empNo);
		}
		
		int totalCount = addressService.selectListCnt(addVo);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 1, 10);
		
		List<MemberVo> addressList = addressService.addressAllList(pv, addVo);
		
		model.addAttribute("pv", pv);
		model.addAttribute("addressParam", addVo);
		model.addAttribute("addressList", addressList);
		
		return "address/address-main";
	}
	
	//외부주소록 조회
	@GetMapping("external/{pno}")
	public String ExList(Model model, @PathVariable int pno, HttpSession session) {
		
		return "address/address-external";
	}
	
}
