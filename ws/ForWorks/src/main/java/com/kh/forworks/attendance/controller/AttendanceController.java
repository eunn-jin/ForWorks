package com.kh.forworks.attendance.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.kh.forworks.attendance.service.AttendanceService;
import com.kh.forworks.attendance.vo.MonthWorkVo;
import com.kh.forworks.attendance.vo.WorkTimeVo;
import com.kh.forworks.attendance.vo.WorkVo;

@Controller
@RequestMapping("att/")
public class AttendanceController {
	
	private final AttendanceService service;
	
	@Autowired
	public AttendanceController(AttendanceService service) {
		this.service = service;
	}
	
	private String getToday() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();        
		String day = sdf.format(now);
		
		return day;
	}
	
	private String getThisMonth() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date now = new Date();        
		String day = sdf.format(now);
		
		return day;
	}
	

	@GetMapping("day")
	public String dayAtt(Model model) {

		//TODO: 화면에 보여줄 것들 가져오기, empNo
		int empNo = 1;       
		String day = getToday();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("day", day);
				
		WorkTimeVo workTime = service.getWorkInfo(empNo);
		WorkVo work = service.getDayWorkInfo(map);
		
		model.addAttribute("workTime", workTime);
		model.addAttribute("work", work);
		
		return "attendance/dayAttendance";
	}
	
	@GetMapping("month")
	public String monthAtt(Model model) {
		
		int empNo = 1;
		String month = getThisMonth();
		
		System.out.println(month);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("month", month);
		
		MonthWorkVo monthCnt = service.getMonthWorkCount(map); 
		monthCnt.setMonth(month);
		
		List<WorkVo> work = service.getWorkList(map);
		
		model.addAttribute("monthCnt", monthCnt);
		model.addAttribute("workList", work);
		
		System.out.println(monthCnt);
		System.out.println(work);
		
		return "attendance/monthAttendance";
	}
	
	@PostMapping("month")
	@ResponseBody
	public List<WorkVo> MonthWork(String month) {
		
		//TODO: 화면에 보여줄 것들 가져오기, empNo 바꾸기
		int empNo = 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("month", month);
		
		MonthWorkVo monthCnt = service.getMonthWorkCount(map); 
		monthCnt.setMonth(month);
		List<WorkVo> workList = service.getWorkList(map);
		
		System.out.println("work :: " + workList + ", "  + month);
		
		return workList;
	}
	
	@GetMapping("off")
	public String offManage() {
		return "attendance/offManagement";
	}
	
	@GetMapping("offConfirm")
	public String offConfirm() {
		return "attendance/offConfirm";
	}
	
	@GetMapping("goWork")
	public String goWork() {
				        
		//TODO:no 값을 로그인멤버 no 로 받아오기
		int empNo = 1;
		String day = getToday();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("day", day);
		
		int result = service.goWork(map);
		
		if(result == 1) {
			return "redirect:/att/day";			
		} else {
			//실패
			return "errorPage";
		}
	}
	
	@GetMapping("outWork/{no}")
	public String outWork(@PathVariable int no) {
		//TODO:empNo 값을 로그인멤버로 받아오기
		int empNo = 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("empNo", empNo);
		
		int result = service.outWork(map);
		
		if(result == 1) {
			return "redirect:/att/day";			
		} else {
			//실패
			return "errorPage";
		}
	}
	
	@PostMapping("dayWorkInfo")
	@ResponseBody
	public WorkVo dayWorkInfo(String date) {
		
		//TODO: 화면에 보여줄 것들 가져오기, empNo 바꾸기
		int empNo = 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("day", date);
		
		WorkVo work = service.getDayWorkInfo(map);
		
		return work;
	}
	
}
