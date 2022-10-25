package com.kh.forworks.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.admin.vo.AdminVo;
import com.kh.forworks.admin.vo.CorpInfoVo;
import com.kh.forworks.member.vo.MemberVo;

public interface AdminDao {

	AdminVo selectOneById(SqlSessionTemplate sst, AdminVo vo);
	
	List<CorpInfoVo> selectPosList(SqlSessionTemplate sst);
	
	List<CorpInfoVo> selectDeptList(SqlSessionTemplate sst);

	List<MemberVo> selectApplyList(SqlSessionTemplate sst);

	int updateApplyMember(SqlSessionTemplate sst, MemberVo vo);

	int deleteMemberByNo(SqlSessionTemplate sst, String empNo);


}
