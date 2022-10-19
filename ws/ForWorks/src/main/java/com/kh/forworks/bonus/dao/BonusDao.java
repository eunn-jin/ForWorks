package com.kh.forworks.bonus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.bonus.vo.BenefitVo;

public interface BonusDao {
	
	//수당추가
	int insertBenefit(SqlSessionTemplate sst, String title);
	//수당목록조회
	List selectBenefit(SqlSessionTemplate sst);
	//부서조회
	List selectDepart(SqlSessionTemplate sst);
	//부서별 사원조회
	List selectEmp(SqlSessionTemplate sst, String depart);
	//받아온 회원번호 직원의 수당조회
	List<BenefitVo> selectOne(SqlSessionTemplate sst, String no);

}
