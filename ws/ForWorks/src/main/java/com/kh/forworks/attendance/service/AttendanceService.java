package com.kh.forworks.attendance.service;

import java.util.Map;

import com.kh.forworks.attendance.vo.WorkTimeVo;
import com.kh.forworks.attendance.vo.WorkVo;

public interface AttendanceService {

	WorkTimeVo getWorkInfo(int empNo);
	WorkVo getDayWorkInfo(Map<String, Object> map);

	int goWork(Map map);
	int outWork(Map<String, Object> map);


}
