package com.kh.forworks.docmanage.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.docmanage.dao.DocmanageDao;
import com.kh.forworks.docmanage.vo.DocVo;

@Service
public class DocmanageServiceImpl implements DocmanageService{

	private final DocmanageDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public DocmanageServiceImpl(DocmanageDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	//일반문서 작성
	@Override
	public int write(DocVo dv) {
		return dao.insertDoc(sst,dv);
	}
	//일반문서 리스트
	@Override
	public List<DocVo> selectDoc() {
		return dao.selectDoc(sst);
	}
	
	
}
