package com.kh.forworks.bonus.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BonusDaoImpl implements BonusDao {

	//수당추가
	@Override
	public int insertBenefit(SqlSessionTemplate sst, String title) {
		System.out.println(title);
		return sst.insert("bonusMapper.addBenefit" , title);
	}

}
