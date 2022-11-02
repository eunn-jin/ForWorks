package com.kh.forworks.off.vo;

import lombok.Data;

@Data
public class OffCntVo {
	private int totalOff;
	private double useOff;
	private double leftOff;
	
	public double setLeftOff() {
		return this.totalOff - this.useOff;
	}
	
	public double addHalfOff(int half) {
		return this.useOff + half/2;
	}
}
