package com.kh.forworks.attendance.dao;

import org.mybatis.spring.SqlSessionTemplate;

public interface AttendanceDao {

	int insertInTime(SqlSessionTemplate sst, String inTime);

}
