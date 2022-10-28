package com.kh.forworks.salary.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.salary.vo.SalBonusVo;
import com.kh.forworks.salary.vo.SalaryVo;

public interface SalaryDao {
	//부서명 조회
	List selectDepart(SqlSessionTemplate sst);
	//부서별 직원조회
	List selectEmp(SqlSessionTemplate sst, String depart);
	//직원,날짜별 보너스 조회
	List<SalBonusVo> selectBonus(SqlSessionTemplate sst, SalaryVo sv);
	//초과수당 조회
	List<SalaryVo> selectAddBenefit(SqlSessionTemplate sst, SalaryVo sv);
	//기본급 + 각종 수당 조회
	List<SalaryVo> selectSalary(SqlSessionTemplate sst, SalaryVo sv);
	//급여대장등록 저장
	int insertSal(SqlSessionTemplate sst, SalaryVo sv);

}
