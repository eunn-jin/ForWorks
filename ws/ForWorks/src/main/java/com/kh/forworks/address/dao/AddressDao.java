package com.kh.forworks.address.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.PageVo;
import com.kh.forworks.member.vo.MemberVo;

public interface AddressDao {
	
	int updateEmpStatByNo(SqlSessionTemplate sst, MemberVo vo);

	int selectCountAll(SqlSessionTemplate sst);
	
	List<MemberVo> selectAllMember(SqlSessionTemplate sst, PageVo pv);

}
