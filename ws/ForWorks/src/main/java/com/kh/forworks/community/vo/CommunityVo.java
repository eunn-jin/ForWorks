package com.kh.forworks.community.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CommunityVo {
	
	private String cmuNo;
	private String empNo;
	private String cmuTitle;
	private String cmuContent;
	private String cmuEnrollDate;
	private String cmuModifiyDate;
	private String cmuCnt;
	private String cmuRead;
	private String cmuStatus;
	private MultipartFile cmuFileName;
}
