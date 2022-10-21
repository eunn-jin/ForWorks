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
import com.kh.forworks.attendance.vo.WorkVo;

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

		//TODO: 화면에 보여줄 것들 가져오기, empNo 바꾸기
		int empNo = 1;
		WorkVo work = service.getWorkInfo(empNo);
		System.out.println(work);
		
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
		
		//TODO:no 값을 로그인멤버 no 로 받아오기
		int empNo = 1;
		
		WorkVo work = new WorkVo();
		work.setEmpNo(empNo);
		work.setInTime(inTime);
		
		int result = service.goWork(work);
		
		if(result == 1) {
			return "redirect:day";			
		} else {
			//실패
			return "errorPage";
		}
	}
	
}
