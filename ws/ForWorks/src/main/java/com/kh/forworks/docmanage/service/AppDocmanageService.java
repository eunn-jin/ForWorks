package com.kh.forworks.docmanage.service;

import java.util.HashMap;
import java.util.List;

import com.kh.forworks.PageVo;
import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.docmanage.vo.DocControlVo;
import com.kh.forworks.member.vo.MemberVo;

public interface AppDocmanageService {
	//부서 불러오기
	List<MemberVo> selectDept();
	//해당직원의 전자결재문서 가져오기
	List<ApprovDocumentVo> selectDocByEmp(HashMap map);
	//문서하나불러오기--하나만 못불러옴
	List<ApprovDocumentVo> selectOneDoc(String adocNo);
	//결재문서관리등록
	int insertDocCont(DocControlVo vo);
	//해당직원이 작성한 총갯수
	int selectTotalCnt(String empNo);
	//해당직원 작성 결재문서가져오기
	List<DocControlVo> selectContDocByEmp(HashMap map);
	//게시상태수정
	int updateStatus(DocControlVo vo);
	//결재문서관리등록한 문서불러오기
	List<DocControlVo> selectContDetail(String no);
	//결재문서등록 공개 리스트
	List<DocControlVo> selectContDocList(PageVo pv);
	//결재문서리스트디테일(화면)
	DocControlVo selectAdocDetail(String no);
	//싸인받아오기
	String selectSign(String adocNo);
	//부서,직급 받아오기
	MemberVo selectMemInfo(String empNo);

}
