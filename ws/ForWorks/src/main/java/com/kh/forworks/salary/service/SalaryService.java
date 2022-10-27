package com.kh.forworks.salary.service;

import java.util.List;

import com.kh.forworks.bonus.vo.BonusVo;
import com.kh.forworks.salary.vo.SalaryVo;

public interface SalaryService {

	//부서조회
	List selectDepartList();
	//부서별 사원목록
	List selectEmp(String depart);
	//직원,날짜기준 보너스 조회
	List<BonusVo> selectBonus(SalaryVo sv);
	//초과수당 조회
	List<SalaryVo> selectAddBenefit(SalaryVo sv);

}
