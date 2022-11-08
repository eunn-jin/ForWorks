package com.kh.forworks.docmanage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.member.vo.MemberVo;

@Repository
public class AppDocmanageDaoImpl implements AppDocmanageDao{
	//부서 불러오기
	@Override
	public List<MemberVo> selectDept(SqlSessionTemplate sst) {
		return sst.selectList("docMapper.selectDept");
	}
	//해당직원의 전자결재문서 받아오기
	@Override
	public List<ApprovDocumentVo> selectDocByEmp(SqlSessionTemplate sst, String empNo) {
		return sst.selectList("docMapper.selectDocByEmp" , empNo);
	}
}
