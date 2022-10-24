package com.kh.forworks.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.admin.vo.AdminVo;

public interface AdminDao {

	AdminVo selectOneById(SqlSessionTemplate sst, AdminVo vo);

}
