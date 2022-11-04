package com.kh.forworks.attendance.service;

import java.util.List;
import java.util.Map;

import com.kh.forworks.attendance.vo.MonthWorkVo;
import com.kh.forworks.attendance.vo.TeamWorkVo;
import com.kh.forworks.attendance.vo.WorkTimeVo;
import com.kh.forworks.attendance.vo.WorkVo;

public interface AttendanceService {

	WorkTimeVo getWorkInfo(String empNo);
	WorkVo getDayWorkInfo(Map<String, Object> map);

	int goWork(Map map);
	int outWork(Map<String, Object> map);
	
	MonthWorkVo getMonthWorkCount(Map<String, Object> map);
	List<WorkVo> getWorkList(Map<String, Object> map);
	TeamWorkVo getTeamTime(String empNo);

}
