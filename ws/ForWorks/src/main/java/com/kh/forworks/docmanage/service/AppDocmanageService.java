package com.kh.forworks.docmanage.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.member.vo.MemberVo;

public interface AppDocmanageService {
	//부서 불러오기
	List<MemberVo> selectDept();
	//해당직원의 전자결재문서 가져오기
	List<ApprovDocumentVo> selectDocByEmp(String empNo);

}
