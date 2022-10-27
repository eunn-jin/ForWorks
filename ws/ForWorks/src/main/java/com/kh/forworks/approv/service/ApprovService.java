package com.kh.forworks.approv.service;

import java.util.List;

import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.approv.vo.DocApprovVo;
import com.kh.forworks.approv.vo.DocFormVo;
import com.kh.forworks.member.vo.MemberVo;

public interface ApprovService {

	//미결재목록호출
	List<ApprovDocumentVo> selectApprovList(String empNo);
	//미확인 협조문서 목록 호출
	List<ApprovDocumentVo> selectCoopList(String empNo);
	//미확인 참조문서 목록 호출
	List<ApprovDocumentVo> selectReferList(String empNo);
	
	//양식 목록 호출
	List<DocFormVo> selectFormList();
	
	//전자문서 작성
	int insertApprovDoc(ApprovDocumentVo vo);
		
	//회원 목록 조회
	List<MemberVo> selectMemberList();
	
	//비전자문서 작성
	int insertApprovNoElecDoc(ApprovDocumentVo vo);
	
	//결재 or 반려
	int updateApprov(DocApprovVo vo);

}
