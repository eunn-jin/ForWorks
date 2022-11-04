package com.kh.forworks.off.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.off.vo.OffTypeVo;
import com.kh.forworks.off.vo.OffVo;

public interface OffDao {

	int getTotalOff(SqlSessionTemplate sst, String empNo);
	int getUseOff(SqlSessionTemplate sst, String empNo);
	int getUseHalfOff(SqlSessionTemplate sst, String empNo);
	
	List<OffVo> selectOffList(SqlSessionTemplate sst, Map<String, Object> map);
	List<OffTypeVo> selectOffTypeList(SqlSessionTemplate sst);
	int insertOffForm(SqlSessionTemplate sst, Map<String, Object> map);

}
