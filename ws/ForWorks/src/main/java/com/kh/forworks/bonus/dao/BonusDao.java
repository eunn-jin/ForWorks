package com.kh.forworks.bonus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface BonusDao {
	
	//�����߰�
	int insertBenefit(SqlSessionTemplate sst, String title);
	//��������ȸ
	List selectBenefit(SqlSessionTemplate sst);
	//�μ���ȸ
	List selectDepart(SqlSessionTemplate sst);

}
