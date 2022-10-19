package com.kh.forworks.bonus.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.bonus.dao.BonusDao;
import com.kh.forworks.bonus.vo.BenefitVo;

@Service
public class BonusServiceImpl implements BonusService {
	
	private final BonusDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public BonusServiceImpl(BonusDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//����ī���߰�
	@Override
	public int insertBenefit(String title) {
		System.out.println(title);
		return dao.insertBenefit(sst,title);
	}
	//��������ȸ
	@Override
	public List selectList() {
		return dao.selectBenefit(sst);
	}
	//�μ���ȸ
	@Override
	public List selectDepartList() {
		return dao.selectDepart(sst);
	}
	//�μ��� �����ȸ
	@Override
	public List selectEmp(String depart) {
		System.out.println("���񽺿��� depart" + depart);
		return dao.selectEmp(sst , depart);
	}
	//����???
	@Override
	public BenefitVo selectEmpBenefit(String depart, String emp) {
		// TODO Auto-generated method stub
		return null;
	}
	//�޾ƿ� ȸ����ȣ ������ ������ȸ
	@Override
	public List<BenefitVo> selectOne(String no) {
		return dao.selectOne(sst, no);
	}

}
