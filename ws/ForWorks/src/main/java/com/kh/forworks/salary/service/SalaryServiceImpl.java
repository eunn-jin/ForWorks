package com.kh.forworks.salary.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.salary.dao.SalaryDao;
import com.kh.forworks.salary.vo.SalBonusVo;
import com.kh.forworks.salary.vo.SalaryVo;

@Service
public class SalaryServiceImpl implements SalaryService{

	private final SalaryDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public SalaryServiceImpl(SalaryDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//부서조회
	@Override
	public List selectDepartList() {
		return dao.selectDepart(sst);
	}
	//부서별 사원조회
	@Override
	public List selectEmp(String depart) {
		return dao.selectEmp(sst , depart);
	}
	//직원,날짜기준 보너스 조회
	@Override
	public List<SalBonusVo> selectBonus(SalaryVo sv) {
		return dao.selectBonus(sst, sv);
	}
	//초과수당조회
	@Override
	public List<SalaryVo> selectAddBenefit(SalaryVo sv) {
		return dao.selectAddBenefit(sst, sv);
	}
	//기본급 + 각종수당 조회
	@Override
	public List<SalaryVo> selectEmpSal(SalaryVo sv) {
		return dao.selectSalary(sst,sv);
	}
	//급여대장등록 저장
	@Override
	public int insertSal(SalaryVo sv) {
		return dao.insertSal(sst,sv);
	}
		
	
}
