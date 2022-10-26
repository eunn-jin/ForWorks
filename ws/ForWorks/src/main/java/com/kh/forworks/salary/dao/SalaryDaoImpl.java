package com.kh.forworks.salary.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SalaryDaoImpl implements SalaryDao {
	//�μ��� ��ȸ
	@Override
	public List selectDepart(SqlSessionTemplate sst) {
		return sst.selectList("bonusMapper.selectDepart");
	}
	//�μ��� ������ȸ
	@Override
	public List selectEmp(SqlSessionTemplate sst, String depart) {
		return sst.selectList("bonusMapper.selectEmp" , depart);
	}

}
