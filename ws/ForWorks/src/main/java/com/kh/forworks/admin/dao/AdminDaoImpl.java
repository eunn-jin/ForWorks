package com.kh.forworks.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.admin.vo.AdminVo;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public AdminVo selectOneById(SqlSessionTemplate sst, AdminVo vo) {
		return sst.selectOne("adminMapper.selectOneById", vo);
	}

}
