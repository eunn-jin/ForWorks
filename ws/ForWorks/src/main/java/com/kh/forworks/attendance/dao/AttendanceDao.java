package com.kh.forworks.attendance.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.attendance.vo.WorkTimeVo;
import com.kh.forworks.attendance.vo.WorkVo;

public interface AttendanceDao {

	WorkTimeVo selectInOutTime(SqlSessionTemplate sst, int empNo);
	int selectDayWork(SqlSessionTemplate sst, int empNo);
	int selectWeekWork(SqlSessionTemplate sst, int empNo);
	int selectMonthWork(SqlSessionTemplate sst, int empNo);
	
	int insertInTime(SqlSessionTemplate sst, WorkVo work);
	int updateOutTime(SqlSessionTemplate sst, WorkTimeVo workTime);

}
