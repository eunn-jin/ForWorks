package com.kh.forworks.vote.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class VoteVo {
	
	//투표
	private String rownum;
	private String vtNo;
	private String vtCreate;
	private String vtEnd;
	private String vtDtdate;
	private String vtUpdate;
	private String vtStatus;
	private String vtTitle;
	private String vtContent;
	private String empNo;
	
	//파일 정보
	private MultipartFile vtFile;
	
}



