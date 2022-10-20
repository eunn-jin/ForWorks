package com.kh.forworks.approv.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.forworks.approv.dao.ApprovDao;

@Service
public class ApprovServiceImpl implements ApprovService {
	
	private final ApprovDao dao;
	private final SqlSessionTemplate sst;
	
	public ApprovServiceImpl(ApprovDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	

}
