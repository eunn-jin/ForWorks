package com.kh.forworks.attendance;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("att/")
public class AttendanceController {

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
