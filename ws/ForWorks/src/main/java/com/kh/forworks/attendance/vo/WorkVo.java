package com.kh.forworks.attendance.vo;

import lombok.Data;

@Data
public class WorkVo {
	
	private int no;
	private String empName;
	private String inTime;
	private String outTime;
	private String statusName;

	private String workTime;
	private String lateTime;
	private String earlyoutTime;
	
	private String workDate;
	private String overTime;
		
}
