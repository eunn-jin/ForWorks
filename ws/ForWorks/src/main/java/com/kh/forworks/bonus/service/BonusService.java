package com.kh.forworks.bonus.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.bonus.vo.BenefitVo;

public interface BonusService {
	
	//�����߰�
	int insertBenefit(String title);
	//����������ȸ
	List selectList();
	//�μ���ȸ
	List selectDepartList();
	//�μ��� ������
	List selectEmp(String depart);
	//�μ�,�̸� �ش�Ǵ� ��� (����?)//////
	BenefitVo selectEmpBenefit(String depart, String emp);
	//�޾ƿ� ȸ����ȣ ������ ������ȸ
	List<BenefitVo> selectOne(String no);
}
