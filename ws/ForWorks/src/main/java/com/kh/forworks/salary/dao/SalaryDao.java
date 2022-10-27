package com.kh.forworks.salary.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.bonus.vo.BonusVo;
import com.kh.forworks.salary.vo.SalaryVo;

public interface SalaryDao {
	//부서명 조회
	List selectDepart(SqlSessionTemplate sst);
	//부서별 직원조회
	List selectEmp(SqlSessionTemplate sst, String depart);
	//직원,날짜별 보너스 조회
	List<BonusVo> selectBonus(SqlSessionTemplate sst, SalaryVo sv);
	//초과수당 조회
	List<SalaryVo> selectAddBenefit(SqlSessionTemplate sst, SalaryVo sv);

}
