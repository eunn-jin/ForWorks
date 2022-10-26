package com.kh.forworks.salary.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SalaryDaoImpl implements SalaryDao {
	//부서명 조회
	@Override
	public List selectDepart(SqlSessionTemplate sst) {
		return sst.selectList("bonusMapper.selectDepart");
	}
	//부서별 직원조회
	@Override
	public List selectEmp(SqlSessionTemplate sst, String depart) {
		return sst.selectList("bonusMapper.selectEmp" , depart);
	}

}
