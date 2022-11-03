package com.kh.forworks.off.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.off.vo.OffTypeVo;
import com.kh.forworks.off.vo.OffVo;

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

	@Override
	public List<OffVo> selectOffList(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.selectList("offMapper.selectOffList", map);
	}

	@Override
	public List<OffTypeVo> selectOffTypeList(SqlSessionTemplate sst) {
		return sst.selectList("offMapper.selectOffTypeList");
	}

	@Override
	public int insertOffForm(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.insert("offMapper.insertOffForm", map);
	}

}
