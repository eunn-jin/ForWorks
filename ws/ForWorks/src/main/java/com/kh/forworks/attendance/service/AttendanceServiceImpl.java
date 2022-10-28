package com.kh.forworks.attendance.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.forworks.attendance.dao.AttendanceDao;
import com.kh.forworks.attendance.vo.MonthWorkVo;
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
	@Transactional
	public int outWork(Map<String, Object> map) {
		
		int result1, result2, result3;
		
		result1 = dao.updateOutTime(sst, map);
		result2 = dao.updateOverTime(sst, map);
		result3 = dao.updateStatus(sst, map);
		
		return result1 * result2 * result3;
	}

	@Override
	public MonthWorkVo getMonthWorkCount(Map<String, Object> map) {
		MonthWorkVo mw = new MonthWorkVo();
		
		mw.setWorkCount(dao.selectWorkCnt(sst, map));
		mw.setLateCount(dao.selectLateCount(sst, map));
		mw.setEarlyoutCount(dao.selectEarlyoutCount(sst, map));
		mw.setOffCount(dao.selectOffCount(sst, map) + dao.selectHalfOffCount(sst, map)/2);
		
		return mw;
	}

}
