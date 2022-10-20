package com.kh.forworks.attendance.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.forworks.attendance.service.AttendanceService;

@Controller
@RequestMapping("att/")
public class AttendanceController {
	
	private final AttendanceService service;
	
	@Autowired
	public AttendanceController(AttendanceService service) {
		this.service = service;
	}
	

	@GetMapping("day")
	public String dayAtt() {
		return "attendance/dayAttendance";
	}
	
	@GetMapping("month")
	public String monthAtt() {
		return "attendance/monthAttendance";
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
				        
		LocalDateTime now = LocalDateTime.now();        
		String inTime = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		System.out.println(inTime);

		int result = service.goWork(inTime);
		
		if(result == 1) {
			return "redirect:day";			
		} else {
			//실패
			return "errorPage";
		}
	}
	
}
