package com.kh.forworks.bonus.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface BonusDao {
	
	//�����߰�
	int insertBenefit(SqlSessionTemplate sst, String title);

}
