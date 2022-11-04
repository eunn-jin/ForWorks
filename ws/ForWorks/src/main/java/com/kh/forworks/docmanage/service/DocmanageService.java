package com.kh.forworks.docmanage.service;

import java.util.HashMap;
import java.util.List;

import com.kh.forworks.PageVo;
import com.kh.forworks.approv.vo.DocFileVo;
import com.kh.forworks.docmanage.vo.DfileVo;
import com.kh.forworks.docmanage.vo.DocVo;

public interface DocmanageService {
	//일반문서 작성
	int write(DocVo dv, DfileVo df);
	//일반문서 리스트
	List<DocVo> selectDoc();
	//전체 문서갯수조회
	int selectTotalCnt(String empNo);
	//문서관리 리스트
	List<DocVo> selectDocByEmp(HashMap map);
	//문서관리 디테일
	DocVo selectOneDoc(String no);
	//공개범위받아오기
	HashMap<String, Object> selectRange();
}
