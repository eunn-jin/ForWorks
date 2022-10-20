package com.kh.forworks.attendance.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.attendance.dao.AttendanceDao;

@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	private final AttendanceDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public AttendanceServiceImpl(SqlSessionTemplate sst, AttendanceDao dao) {
		this.sst = sst;
		this.dao = dao;
	}

	@Override
	public int goWork(String inTime) {
		
		int result = dao.insertInTime(sst, inTime);
		
		return result;
	}
	
	

}
