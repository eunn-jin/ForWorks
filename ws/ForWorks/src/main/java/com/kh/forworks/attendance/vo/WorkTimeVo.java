package com.kh.forworks.attendance.vo;

import lombok.Data;

@Data
public class WorkTimeVo {
	private int no;
	private int empNo;
	
	private String inTime;
	private String outTime;
	
	private String monthWork;
	private String weekWork;
	private String dayWork;
	
	public void MonthWorkToStr(int t) {
		int hours = t / 60;
		int minutes = t % 60;
		String timeformat = String.format(hours+":"+minutes, "%02d");
		this.monthWork = timeformat;
	}
	
	public void WeekWorkToStr(int t) {
		int hours = t / 60;
		int minutes = t % 60;
		String timeformat = String.format(hours+":"+minutes, "%02d");
		this.weekWork = timeformat;
	}
	
	public void DayWorkToStr(int t) {
		int hours = t / 60;
		int minutes = t % 60;
		String timeformat = String.format(hours+":"+minutes, "%02d");
		this.dayWork = timeformat;
	}
}
