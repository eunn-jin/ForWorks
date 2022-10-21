package com.kh.forworks.attendance.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.attendance.vo.WorkVo;

public interface AttendanceDao {

	WorkVo selectWork(SqlSessionTemplate sst, int empNo);

	int insertInTime(SqlSessionTemplate sst, WorkVo work);

	int selectMonthWork(SqlSessionTemplate sst, int empNo);

}
