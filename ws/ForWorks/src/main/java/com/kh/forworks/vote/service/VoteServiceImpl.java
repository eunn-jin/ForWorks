package com.kh.forworks.vote.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.PageVo;
import com.kh.forworks.department.vo.DepartmentVo;
import com.kh.forworks.vote.dao.VoteDao;
import com.kh.forworks.vote.vo.VoteVo;

@Service
public class VoteServiceImpl implements VoteService{
	
	private final SqlSessionTemplate sst;
	private final VoteDao dao;
	
	@Autowired
	public VoteServiceImpl(SqlSessionTemplate sst, VoteDao dao) {
		this.sst = sst;
		this.dao = dao;
	}
	
	//부서정보 가져오기
	@Override
	public List<DepartmentVo> selectAlldp() {
		return dao.selectAlldp(sst);
	}
	
	//전체
	@Override
	public int selectTotalCount() {
		return dao.selectTotalCount(sst);
	}

	@Override
	public List<VoteVo> selectList(PageVo pv) {
		return dao.selectList(sst, pv);
	}
	
	//진행중
	@Override
	public int selecting() {
		return dao.selecting(sst);
	}

	@Override
	public List<VoteVo> selectListing(PageVo pving) {
		return dao.selectListing(sst, pving);
	}
	
	//마감
	@Override
	public int selectEnd() {
		return dao.selectEnd(sst);
	}

	@Override
	public List<VoteVo> selectListEnd(PageVo pvend) {
		return dao.selectListEnd(sst, pvend);
	}
	
	
}
