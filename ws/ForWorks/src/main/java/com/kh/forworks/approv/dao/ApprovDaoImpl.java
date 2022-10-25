package com.kh.forworks.approv.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.member.vo.MemberVo;

@Repository
public class ApprovDaoImpl implements ApprovDao {

	//미결재 문서 조회
	@Override
	public List<ApprovDocumentVo> selectApprovList(SqlSessionTemplate sst, String empNo) {
		// TODO Auto-generated method stub
		return null;
	}
	//미확인 협조 문서 조회
	@Override
	public List<ApprovDocumentVo> selectCoopList(SqlSessionTemplate sst, String empNo) {
		// TODO Auto-generated method stub
		return null;
	}
	//미확인 참조 문서 조회
	@Override
	public List<ApprovDocumentVo> selectReferList(SqlSessionTemplate sst, String empNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//회원 목록 조회
	@Override
	public List<MemberVo> selectMemberList(SqlSessionTemplate sst) {
		// TODO Auto-generated method stub
		return sst.selectList("approvMapper.selectMemberList");
	}

	
}
