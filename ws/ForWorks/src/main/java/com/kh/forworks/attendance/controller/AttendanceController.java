package com.kh.forworks.attendance.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.kh.forworks.attendance.vo.TeamWorkVo;
import com.kh.forworks.attendance.vo.WorkTimeVo;
import com.kh.forworks.attendance.vo.WorkVo;
import com.kh.forworks.member.vo.MemberVo;

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
	
//	private String getThisMonth() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
//		Date now = new Date();        
//		String day = sdf.format(now);
//		
//		return day;
//	}
	
	private String monthForm(String str) {
		String year = str.substring(0, 4);
		String month = str.substring(5, 7);
		String day = str.substring(8, 10);
		
		int yearNum = Integer.parseInt(year);
		int monthNum = Integer.parseInt(month);
		int dayNum = Integer.parseInt(day);
		
		if(dayNum != 1) {
			monthNum = monthNum + 1 ;
			if(monthNum == 13) {
				yearNum++;
				monthNum = 1;
			}
		}
		
		return yearNum + "-" + monthNum;
	}

	@GetMapping("day")
	public String dayAtt(Model model, HttpSession session) {

		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String empNo = loginMember.getEmpNo();
		String day = getToday();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("day", day);
				
		WorkTimeVo workTime = service.getWorkInfo(empNo);
		WorkVo work = service.getDayWorkInfo(map);
		TeamWorkVo team = service.getTeamTime(empNo);
				
		model.addAttribute("workTime", workTime);
		model.addAttribute("work", work);
		model.addAttribute("team", team);
		model.addAttribute("today", day);
		
		return "attendance/dayAttendance";
	}
	
	@GetMapping("month")
	public String monthAtt(Model model) {
		return "attendance/monthAttendance";
	}
	
	@PostMapping("month")
	@ResponseBody
	public List<WorkVo> MonthWork(String month, HttpSession session) {

		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String empNo = loginMember.getEmpNo();
		
		month = monthForm(month);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("month", month);
		
		List<WorkVo> workList = service.getWorkList(map);
		
		return workList;
	}
	
	@PostMapping("monthCnt")
	@ResponseBody
	public MonthWorkVo MonthCnt(String month, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String empNo = loginMember.getEmpNo();
		month = monthForm(month);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("month", month);
		
		MonthWorkVo monthCnt = service.getMonthWorkCount(map); 
		monthCnt.setMonth(month);
		
		return monthCnt;
	}
	
	@GetMapping("goWork")
	public String goWork(HttpSession session) {
				        
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String empNo = loginMember.getEmpNo();
		String day = getToday();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("day", day);
		
		int result = service.goWork(map);
		
		if(result == 1) {
			return "redirect:/att/day";			
		} else {
			return "errorPage";
		}
	}
	
	@GetMapping("outWork/{no}")
	public String outWork(@PathVariable int no, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String empNo = loginMember.getEmpNo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("empNo", empNo);
		
		int result = service.outWork(map);
		
		if(result == 1) {
			return "redirect:/att/day";			
		} else {
			return "errorPage";
		}
	}
	
	@PostMapping("dayWorkInfo")
	@ResponseBody
	public WorkVo dayWorkInfo(String date, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String empNo = loginMember.getEmpNo();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNo", empNo);
		map.put("day", date);
		
		WorkVo work = service.getDayWorkInfo(map);
		
		return work;
	}
	
}
