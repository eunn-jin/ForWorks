package com.kh.forworks.bonus.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface BonusService {
	
	//�����߰�
	int insertBenefit(String title);
	//����������ȸ
	List selectList();
	//�μ���ȸ
	List selectDepartList();
}
