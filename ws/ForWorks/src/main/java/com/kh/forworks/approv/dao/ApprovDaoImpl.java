package com.kh.forworks.approv.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.approv.vo.ApprovDocumentVo;

@Repository
public class ApprovDaoImpl implements ApprovDao {

	@Override
	public List<ApprovDocumentVo> selectApprovList(SqlSessionTemplate sst, String empNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ApprovDocumentVo> selectCoopList(SqlSessionTemplate sst, String empNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ApprovDocumentVo> selectReferList(SqlSessionTemplate sst, String empNo) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
