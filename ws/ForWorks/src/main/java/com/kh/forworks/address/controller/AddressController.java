package com.kh.forworks.address.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forworks.PageVo;
import com.kh.forworks.Pagination;
import com.kh.forworks.address.service.AddressService;
import com.kh.forworks.member.vo.MemberVo;

@Controller
@RequestMapping("address")
public class AddressController {
	
	private final AddressService addressService;
	
	public AddressController(AddressService addressService) {
		this.addressService = addressService;
	}
	
	//조직주소록 조회, 정렬(이름/부서/직급), 검색
	@GetMapping("/{pno}")
	public String List(Model model, @PathVariable int pno) {
		
		int totalCount = addressService.selectListCnt();
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 1, 10);
		
		List<MemberVo> addressList = addressService.addressAllList(pv);
		
		model.addAttribute("addressList", addressList);
		model.addAttribute("pv", pv);
		
		return "address/address-main";
	}
	
	//중요주소록 조회
	
	//부서주소록 조회
	
	//외부주소록 조회
	
}
