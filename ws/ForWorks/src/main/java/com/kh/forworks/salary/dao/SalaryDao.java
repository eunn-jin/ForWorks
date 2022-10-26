package com.kh.forworks.salary.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface SalaryDao {
	//부서명 조회
	List selectDepart(SqlSessionTemplate sst);
	//부서별 직원조회
	List selectEmp(SqlSessionTemplate sst, String depart);

}
