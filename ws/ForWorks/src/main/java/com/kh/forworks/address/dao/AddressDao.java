package com.kh.forworks.address.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.PageVo;
import com.kh.forworks.address.vo.AddressVo;
import com.kh.forworks.member.vo.MemberVo;

public interface AddressDao {
	
	int updateEmpStatByNo(SqlSessionTemplate sst, MemberVo vo);

	int insertFavoriteMember(SqlSessionTemplate sst, MemberVo vo);
	
	int deleteFavoriteMember(SqlSessionTemplate sst, MemberVo vo);
	
	int selectCountAll(SqlSessionTemplate sst, AddressVo addVo);
	
	List<MemberVo> selectAllMember(SqlSessionTemplate sst, PageVo pv, AddressVo addVo);



}
