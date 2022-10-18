package com.kh.forworks.bonus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface BonusDao {
	
	//수당추가
	int insertBenefit(SqlSessionTemplate sst, String title);
	//수당목록조회
	List selectBenefit(SqlSessionTemplate sst);
	//부서조회
	List selectDepart(SqlSessionTemplate sst);

}
