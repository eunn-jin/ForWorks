package com.kh.forworks.off.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.forworks.off.service.OffService;
import com.kh.forworks.off.vo.OffCntVo;
import com.kh.forworks.off.vo.OffTypeVo;
import com.kh.forworks.off.vo.OffVo;

@Controller
@RequestMapping("off")
public class OffController {

	private final OffService service;
	
	@Autowired
	public OffController(OffService service) {
		this.service = service;
	}
	
	@GetMapping("manage")
	public String offManage(Model model) {
		
		int empNo = 1;
		OffCntVo offCnt = service.getOffCnt(empNo);
		List<OffTypeVo> offTypeList = service.getOffTypeList();
		
		model.addAttribute("offCnt", offCnt);
		model.addAttribute("offTypeList", offTypeList);
		
		return "off/offManagement";
	}
	
	@GetMapping("confirm")
	public String offConfirm() {
		return "off/offConfirm";
	}

	@PostMapping("offInfo")
	@ResponseBody
	public List<OffVo> getOffInfo(String year) {
		
		int empNo = 1; 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("year", year);
		
		List<OffVo> offList = service.getOffList(map);
		
		return offList;
	}
	
	@PostMapping("submitOff")
	@ResponseBody
	public String submitOffForm(String start, String end ,int type) {
		
		int empNo = 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		
		int result = service.submitOff(map);
		
		if(result == 1) {
			return "success";			
		} else {
			return "fail";
		}
	}
}
