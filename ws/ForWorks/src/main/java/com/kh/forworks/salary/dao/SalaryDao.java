package com.kh.forworks.salary.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface SalaryDao {
	//�μ��� ��ȸ
	List selectDepart(SqlSessionTemplate sst);
	//�μ��� ������ȸ
	List selectEmp(SqlSessionTemplate sst, String depart);

}
