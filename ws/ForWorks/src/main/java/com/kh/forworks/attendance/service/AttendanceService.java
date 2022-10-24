package com.kh.forworks.attendance.service;

import com.kh.forworks.attendance.vo.WorkTimeVo;
import com.kh.forworks.attendance.vo.WorkVo;

public interface AttendanceService {

	WorkTimeVo getWorkInfo(int empNo);
	WorkVo getDayWorkInfo(int empNo);

	int goWork(WorkVo work);
	int outWork(WorkTimeVo workTime);


}
