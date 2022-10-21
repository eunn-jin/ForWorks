package com.kh.forworks.attendance.vo;

import lombok.Data;

@Data
public class WorkVo {
	
	private int no;
	private int empNo;
	private String inTime;
	private String outTime;
	private String statusCode;
	private String statusName;

	private String overTime;
	private String lateTime;
	private String workTime;
	
	private String workDay;
	
	private String monthWork;
	private String weekWork;
	private String dayWork;
	
	public void setMonthWorkWithNum(int t) {
		int hours = t / 60;
		int minutes = t % 60;
		String timeformat = String.format(hours+":"+minutes, "%02d");
		this.monthWork = timeformat;
	}
	
}
