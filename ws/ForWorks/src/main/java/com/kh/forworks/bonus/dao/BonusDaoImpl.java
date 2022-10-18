package com.kh.forworks.bonus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
