package com.kh.forworks.attendance.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AttendanceDaoImpl implements AttendanceDao {

	@Override
	public int insertInTime(SqlSessionTemplate sst, String inTime) {
		return sst.insert("attendanceMapper.insertInTime",inTime);
	}

}
