package com.kh.forworks.bonus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.bonus.vo.BenefitVo;
import com.kh.forworks.bonus.vo.BonusVo;

public interface BonusDao {
	
	//�����߰�
	int insertBenefit(SqlSessionTemplate sst, String title);
	//��������ȸ
	List selectBenefit(SqlSessionTemplate sst);
	//�μ���ȸ
	List selectDepart(SqlSessionTemplate sst);
	//�μ��� �����ȸ
	List selectEmp(SqlSessionTemplate sst, String depart);
	//�޾ƿ� ȸ����ȣ ������ ������ȸ
	List<BenefitVo> selectOne(SqlSessionTemplate sst, String no);
	//�������
	int updateOne(SqlSessionTemplate sst, BenefitVo vo);

	//�󿩱� �����ȸ(ȭ��)
	List<BonusVo> selectList(SqlSessionTemplate sst);

}
