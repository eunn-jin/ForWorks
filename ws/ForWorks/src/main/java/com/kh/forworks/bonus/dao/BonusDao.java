package com.kh.forworks.bonus.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface BonusDao {
	
	//수당추가
	int insertBenefit(SqlSessionTemplate sst, String title);

}
