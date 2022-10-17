package com.kh.forworks.bonus.service;

import org.mybatis.spring.SqlSessionTemplate;

public interface BonusService {
	
	//수당추가
	int insertBenefit(String title);
}
