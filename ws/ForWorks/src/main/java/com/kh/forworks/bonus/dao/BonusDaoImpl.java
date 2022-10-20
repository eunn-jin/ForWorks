package com.kh.forworks.bonus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.bonus.vo.BenefitVo;
import com.kh.forworks.bonus.vo.BonusVo;

@Repository
public class BonusDaoImpl implements BonusDao {

	//수당추가
	@Override
	public int insertBenefit(SqlSessionTemplate sst, String title) {
		return sst.insert("bonusMapper.addBenefit" , title);
	}
	//수당목록조회
	@Override
	public List selectBenefit(SqlSessionTemplate sst) {
		return sst.selectList("bonusMapper.selectBenefit");
	}
	//부서조회
	@Override
	public List selectDepart(SqlSessionTemplate sst) {
		return sst.selectList("bonusMapper.selectDepart");
	}
	//부서별 사원조회
	@Override
	public List selectEmp(SqlSessionTemplate sst , String depart) {
		
		System.out.println("dao에서 depart" + depart);
		List result = sst.selectList("bonusMapper.selectEmp" , depart);
		System.out.println(result);
		return result;
	}
	//받아온 회원번호 직원의 수당조회
	@Override
	public List<BenefitVo> selectOne(SqlSessionTemplate sst, String no) {
		return sst.selectList("bonusMapper.selectOne" , no);
	}
	//수당수정
	@Override
	public int updateOne(SqlSessionTemplate sst, BenefitVo vo) {
		return sst.update("bonusMapper.updateOne" , vo);
	}
	
	//상여금 목록조회(화면)
	@Override
	public List<BonusVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("bonusMapper.bonusList");
	}

}
