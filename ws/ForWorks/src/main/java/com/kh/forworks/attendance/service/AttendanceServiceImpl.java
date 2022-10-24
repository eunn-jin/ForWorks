package com.kh.forworks.attendance.service;

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
		
		if(wvo.getOutTime().equals("미등록")) {
			week += day;
			month += day;
		}
		
		wvo.DayWorkToStr(day);
		wvo.WeekWorkToStr(week); 
		wvo.MonthWorkToStr(month);
				
		return wvo;
	}

	@Override
	public WorkVo getDayWorkInfo(int empNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int goWork(WorkVo work) {
		return dao.insertInTime(sst, work);
	}

	@Override
	public int outWork(WorkTimeVo workTime) {
		return dao.updateOutTime(sst, workTime);
	}

}
