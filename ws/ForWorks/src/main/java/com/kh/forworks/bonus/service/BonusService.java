package com.kh.forworks.bonus.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.bonus.vo.BenefitVo;

public interface BonusService {
	
	//수당추가
	int insertBenefit(String title);
	//수당종류조회
	List selectList();
	//부서조회
	List selectDepartList();
	//부서별 사원목록
	List selectEmp(String depart);
	//부서,이름 해당되는 사람 (삭제?)//////
	BenefitVo selectEmpBenefit(String depart, String emp);
	//받아온 회원번호 직원의 수당조회
	List<BenefitVo> selectOne(String no);
}
