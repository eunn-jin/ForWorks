package com.kh.forworks.attendance.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.attendance.dao.AttendanceDao;
import com.kh.forworks.attendance.vo.WorkVo;

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
	public WorkVo getWorkInfo(int empNo) {
		WorkVo vo = dao.selectWork(sst, empNo);
//		int x = dao.selectMonthWork(sst, empNo);
//		vo.setMonthWorkWithNum(x);
		
		return vo;
	}

	@Override
	public int goWork(WorkVo work) {
		return dao.insertInTime(sst, work);
	}

		

}
