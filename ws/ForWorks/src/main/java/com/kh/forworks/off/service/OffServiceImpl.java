package com.kh.forworks.off.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.off.dao.OffDao;

@Service
public class OffServiceImpl implements OffService {

	private final OffDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public OffServiceImpl(SqlSessionTemplate sst, OffDao dao) {
		this.sst = sst;
		this.dao = dao;
	}
	
	
}
