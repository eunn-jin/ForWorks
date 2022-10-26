package com.kh.forworks.salary.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.salary.dao.SalaryDao;

@Service
public class SalaryServiceImpl implements SalaryService{

	private final SalaryDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public SalaryServiceImpl(SalaryDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//부서조회
	@Override
	public List selectDepartList() {
		return dao.selectDepart(sst);
	}
	//부서별 사원조회
	@Override
	public List selectEmp(String depart) {
		return dao.selectEmp(sst , depart);
	}
		
	
}
