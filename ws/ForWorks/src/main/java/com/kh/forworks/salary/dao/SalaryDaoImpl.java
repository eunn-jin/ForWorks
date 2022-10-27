package com.kh.forworks.salary.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.bonus.vo.BonusVo;
import com.kh.forworks.salary.vo.SalaryVo;

@Repository
public class SalaryDaoImpl implements SalaryDao {
	//부서명 조회
	@Override
	public List selectDepart(SqlSessionTemplate sst) {
		return sst.selectList("bonusMapper.selectDepart");
	}
	//부서별 직원조회
	@Override
	public List selectEmp(SqlSessionTemplate sst, String depart) {
		return sst.selectList("bonusMapper.selectEmp" , depart);
	}
	//직원,날짜로 보너스조회
	@Override
	public List<BonusVo> selectBonus(SqlSessionTemplate sst, SalaryVo sv) {
		return sst.selectList("salaryMapper.selectBonus", sv);
	}
	//초과수당조회
	@Override
	public List<SalaryVo> selectAddBenefit(SqlSessionTemplate sst, SalaryVo sv) {
		return sst.selectOne("salaryMapper.selectBenefit",sv);
	}

}
