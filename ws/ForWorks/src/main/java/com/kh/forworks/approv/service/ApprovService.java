package com.kh.forworks.approv.service;

import java.util.List;

import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.approv.vo.DocFormVo;

public interface ApprovService {

	//미결재목록호출
	List<ApprovDocumentVo> selectApprovList(String empNo);
	//미확인 협조문서 목록 호출
	List<ApprovDocumentVo> selectCoopList(String empNo);
	//미확인 참조문서 목록 호출
	List<ApprovDocumentVo> selectReferList(String empNo);
	
	//양식 목록 호출
	List<DocFormVo> selectFormList();

}
