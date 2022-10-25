package com.kh.forworks.bonus.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.bonus.vo.BenefitVo;
import com.kh.forworks.bonus.vo.BonusMemVo;
import com.kh.forworks.bonus.vo.BonusVo;

public interface BonusService {
	
	//�����߰�
	int insertBenefit(String title);
	//��������ȸ
	List selectList();
	//�μ���ȸ
	List selectDepartList();
	//�μ��� ������
	List selectEmp(String depart);
	//�޾ƿ� ȸ����ȣ ������ ������ȸ
	List<BenefitVo> selectOne(String no);
	//���� ����
	List<BenefitVo> edit(BenefitVo vo);
	
	//�󿩱� �����ȸ(ȭ��)
	List<BonusVo> bonusList();
	//�󿩱� ��� ajax
	int addBonus(BonusVo bv);
	//�⵵�� �󿩱� ��ȸ
	List<BonusVo> bonusYearList(String year);
	//�󿩱� �ش�������ȸ
	List<BonusMemVo> memList(String no);
	//�󿩱� �ش����� �߰�
	int addEmp(BonusMemVo bmv);
	//������ �Է½� ���޾װ��
	int calc(BonusMemVo bmv);
	
}
