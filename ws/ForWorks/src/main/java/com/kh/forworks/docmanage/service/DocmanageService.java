package com.kh.forworks.docmanage.service;

import java.util.HashMap;
import java.util.List;

import com.kh.forworks.docmanage.vo.DfileVo;
import com.kh.forworks.docmanage.vo.DocVo;
import com.kh.forworks.member.vo.MemberVo;

public interface DocmanageService {
	//일반문서 작성
	int write(DocVo dv, DfileVo df);
	//일반문서 리스트
	List<DocVo> selectRangeDoc(String range);
	//전체 문서갯수조회
	int selectTotalCnt(String empNo);
	//문서관리 리스트
	List<DocVo> selectDocByEmp(HashMap map);
	//문서관리 디테일
	DocVo selectOneDoc(String no);
	//공개범위받아오기
	List<MemberVo> selectDept();
	//전체 문서갯수조회(range)
	int selectRangeTotalCnt(String range);
}
