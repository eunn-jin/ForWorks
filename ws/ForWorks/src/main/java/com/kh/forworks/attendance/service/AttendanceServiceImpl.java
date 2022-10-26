package com.kh.forworks.attendance.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.attendance.dao.AttendanceDao;
import com.kh.forworks.attendance.vo.WorkTimeVo;
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
	public WorkTimeVo getWorkInfo(int empNo) {
		WorkTimeVo wvo = dao.selectInOutTime(sst, empNo);
		
		int day = dao.selectDayWork(sst, empNo);
		int week = dao.selectWeekWork(sst, empNo);
		int month = dao.selectMonthWork(sst, empNo);
		
		if(wvo.getInTime() != null && wvo.getOutTime().equals("미등록")) {
			week += day;
			month += day;
		}
		
		wvo.setDayWork(day);
		wvo.setWeekWork(week); 
		wvo.setMonthWork(month);
		
		System.out.println("getWorkInfo :: " + wvo + ", " + day);
				
		return wvo;
	}

	@Override
	public WorkVo getDayWorkInfo(Map<String, Object> map) {		
		return dao.selectDayWorkInfo(sst, map);
	}
	
	@Override
	public int goWork(Map map) {
		return dao.insertInTime(sst, map);
	}

	@Override
	public int outWork(WorkTimeVo workTime) {
		return dao.updateOutTime(sst, workTime);
	}

}
