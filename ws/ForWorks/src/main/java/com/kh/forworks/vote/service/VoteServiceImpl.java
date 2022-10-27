package com.kh.forworks.vote.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.vote.dao.VoteDao;

@Service
public class VoteServiceImpl implements VoteService{
	
	private final SqlSessionTemplate sst;
	private final VoteDao dao;
	
	@Autowired
	public VoteServiceImpl(SqlSessionTemplate sst, VoteDao dao) {
		this.sst = sst;
		this.dao = dao;
	}
	
	
}
