package com.kh.forworks.attendance.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.attendance.vo.WorkVo;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {

	@Override
	public WorkVo selectWork(SqlSessionTemplate sst, int empNo) {
		return sst.selectOne("attendanceMapper.selectWork", empNo);
	}

	@Override
	public int insertInTime(SqlSessionTemplate sst, WorkVo work) {
		return sst.insert("attendanceMapper.insertInTime", work);
	}

	@Override
	public int selectMonthWork(SqlSessionTemplate sst, int empNo) {
		System.out.println("dao들어옴" + empNo);
		return sst.selectOne("attendanceMapper.selectMonthWork", empNo);
	}

}
