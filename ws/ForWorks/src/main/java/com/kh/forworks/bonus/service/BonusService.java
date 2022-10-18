package com.kh.forworks.bonus.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface BonusService {
	
	//수당추가
	int insertBenefit(String title);
	//수당종류조회
	List selectList();
	//부서조회
	List selectDepartList();
	//부서별 사원목록
	List selectEmp(String depart);
}
