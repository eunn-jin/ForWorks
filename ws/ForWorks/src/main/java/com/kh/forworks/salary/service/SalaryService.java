package com.kh.forworks.salary.service;

import java.util.List;

public interface SalaryService {

	//부서조회
	List selectDepartList();
	//부서별 사원목록
	List selectEmp(String depart);

}
