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

	private String workTime;
	private String overTime;
	private String lateTime;
	
	private String workDay;
		
}
