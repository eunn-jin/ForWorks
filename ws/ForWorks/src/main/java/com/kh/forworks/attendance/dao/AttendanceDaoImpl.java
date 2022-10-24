package com.kh.forworks.attendance.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.attendance.vo.WorkTimeVo;
import com.kh.forworks.attendance.vo.WorkVo;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {

	@Override
	public WorkTimeVo selectInOutTime(SqlSessionTemplate sst, int empNo) {
		return sst.selectOne("attendanceMapper.selectInOutTime", empNo);
	}

	@Override
	public int selectDayWork(SqlSessionTemplate sst, int empNo) {
		return sst.selectOne("attendanceMapper.selectDayWork", empNo);
	}
	
	@Override
	public int selectWeekWork(SqlSessionTemplate sst, int empNo) {	
		return sst.selectOne("attendanceMapper.selectWeekWork", empNo); 
	}
	
	@Override
	public int selectMonthWork(SqlSessionTemplate sst, int empNo) {
		return sst.selectOne("attendanceMapper.selectMonthWork", empNo);
	}

	@Override
	public int insertInTime(SqlSessionTemplate sst, WorkVo work) {
		return sst.insert("attendanceMapper.insertInTime", work);
	}

	@Override
	public int updateOutTime(SqlSessionTemplate sst, WorkTimeVo workTime) {
		return sst.update("attendanceMapper.updateOutTime", workTime);
	}

}
