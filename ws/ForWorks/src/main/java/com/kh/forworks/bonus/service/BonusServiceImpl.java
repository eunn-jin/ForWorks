package com.kh.forworks.bonus.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.bonus.dao.BonusDao;

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

}
