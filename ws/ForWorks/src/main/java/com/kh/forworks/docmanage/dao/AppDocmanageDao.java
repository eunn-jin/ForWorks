package com.kh.forworks.docmanage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.member.vo.MemberVo;

public interface AppDocmanageDao {
	//부서불러오기
	List<MemberVo> selectDept(SqlSessionTemplate sst);
	//해당직원의 전자결재문서 받아오기
	List<ApprovDocumentVo> selectDocByEmp(SqlSessionTemplate sst, String empNo);
	
	
	
}
