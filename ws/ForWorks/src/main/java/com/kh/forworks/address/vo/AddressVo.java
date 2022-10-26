package com.kh.forworks.address.vo;

import lombok.Data;

@Data
public class AddressVo {
	
	private String empNo;
	
	//주소록 조회/정렬/검색용
	private String nav;
	private String deptNo;
	private String sort;
	private String order;
	private String keyword;
	
	
}
