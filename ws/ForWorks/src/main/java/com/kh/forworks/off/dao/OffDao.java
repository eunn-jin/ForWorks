package com.kh.forworks.off.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface OffDao {

	int getTotalOff(SqlSessionTemplate sst, int empNo);
	int getUseOff(SqlSessionTemplate sst, int empNo);
	int getUseHalfOff(SqlSessionTemplate sst, int empNo);

}
