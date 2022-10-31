package com.kh.forworks.attendance.vo;

import lombok.Data;

@Data
public class MonthWorkVo {
	private int empNo;
	private String month;
	
	private int workCount;
	private int lateCount;
	private int earlyoutCount;
	private double offCount;
}