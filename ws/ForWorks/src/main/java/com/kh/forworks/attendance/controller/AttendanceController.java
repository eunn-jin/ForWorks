package com.kh.forworks.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
}
