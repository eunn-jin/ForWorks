package com.kh.forworks.docmanage.vo;

import lombok.Data;

@Data
public class DocControlVo {
	private String contNo;
	private String contEnrollDate;
	private String contEndDate;
	private String contStatus;
	private String adocNo;
	private String docNo;
	private String range;
	public String[] range_;
	
	public String adocName;
	public String adocContent;
	public String draftDate;
	public String noelecStatus;
	public String approveNo;
	public String approveStatus;
	public String approveDate;
	public String approveMember;
	public String empNo;
	public String empName;
	
	public String fileName;
	public String changeFileName;
	
	public String signFile;
}
