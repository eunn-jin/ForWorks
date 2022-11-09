package com.kh.forworks.docmanage.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.docmanage.dao.AppDocmanageDao;
import com.kh.forworks.docmanage.dao.DocmanageDao;
import com.kh.forworks.member.vo.MemberVo;

@Service
public class AppDocmanageServiceImpl implements AppDocmanageService{
	private final AppDocmanageDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public AppDocmanageServiceImpl(AppDocmanageDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	//부서 불러오기
	@Override
	public List<MemberVo> selectDept() {
		return dao.selectDept(sst);
	}
	//해당직원의 전자결재문서 받아오기
	@Override
	public List<ApprovDocumentVo> selectDocByEmp(String empNo) {
		return dao.selectDocByEmp(sst,empNo);
	}
}
