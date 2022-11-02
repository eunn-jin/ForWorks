package com.kh.forworks.off.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OffDaoImpl implements OffDao {

	@Override
	public int getTotalOff(SqlSessionTemplate sst, int empNo) {
		return sst.selectOne("offMapper.selectTotalOff", empNo);
	}

	@Override
	public int getUseOff(SqlSessionTemplate sst, int empNo) {
		return sst.selectOne("offMapper.selectUseOff", empNo);
	}

	@Override
	public int getUseHalfOff(SqlSessionTemplate sst, int empNo) {
		return sst.selectOne("offMapper.selectUseHalfOff", empNo);
	}

}
