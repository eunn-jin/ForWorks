package com.kh.forworks.bonus.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.bonus.dao.BonusDao;
import com.kh.forworks.bonus.vo.BenefitVo;
import com.kh.forworks.bonus.vo.BonusVo;

@Service
public class BonusServiceImpl implements BonusService {
	
	private final BonusDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public BonusServiceImpl(BonusDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//수당카테추가
	@Override
	public int insertBenefit(String title) {
		System.out.println(title);
		return dao.insertBenefit(sst,title);
	}
	//수당목록조회
	@Override
	public List selectList() {
		return dao.selectBenefit(sst);
	}
	//부서조회
	@Override
	public List selectDepartList() {
		return dao.selectDepart(sst);
	}
	//부서별 사원조회
	@Override
	public List selectEmp(String depart) {
		System.out.println("서비스에서 depart" + depart);
		return dao.selectEmp(sst , depart);
	}
	
	//받아온 회원번호 직원의 수당조회
	@Override
	public List<BenefitVo> selectOne(String no) {
		return dao.selectOne(sst, no);
	}
	//수당 수정
	@Override
	public List<BenefitVo> edit(BenefitVo vo) {
		int result = dao.updateOne(sst,vo);
		List<BenefitVo> updatedBenefit = null;
		if(result ==1 ) {
			updatedBenefit = this.selectOne(vo.getEmpNo());
			System.out.println("수정 후 vo ::: " + updatedBenefit);
		}
		return updatedBenefit; 
	}
	
	//상여금 목록조회(화면)
	@Override
	public List<BonusVo> bonusList() {
		return dao.selectList(sst);
	}
	
	//상여금 등록ajax
	@Override
	public int addBonus(BonusVo bv) {
		return dao.insertBonus(sst, bv);
	}

}
