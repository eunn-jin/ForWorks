package com.kh.forworks.attendance.service;

import com.kh.forworks.attendance.vo.WorkVo;

public interface AttendanceService {

	WorkVo getWorkInfo(int empNo);

	int goWork(WorkVo work);

}
