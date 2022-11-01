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
	
	private String regInTime;
	private String regOutTime;
	
	public void setMonthWork(int t) {
		this.monthWork = changeFormat(t);
	}
	
	public void setWeekWork(int t) {
		this.weekWork = changeFormat(t);
	}
	
	public void setDayWork(int t) {
		this.dayWork = changeFormat(t);
	}
	
	private String changeFormat(int t) {
		int hour = 0;
		int min = 0;
		
		if(t < 0) {
			
		} else {
			hour = t / 60;
			min = t % 60;
		}
		
		return String.format("%02d", hour) + ":" + String.format("%02d", min);
	}
}
