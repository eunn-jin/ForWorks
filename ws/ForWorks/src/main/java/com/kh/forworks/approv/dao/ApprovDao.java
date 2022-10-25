package com.kh.forworks.approv.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.member.vo.MemberVo;

public interface ApprovDao {

	//미결재목록호출
	List<ApprovDocumentVo> selectApprovList(SqlSessionTemplate sst, String empNo);

	//미확인 협조문서 목록 호출
	List<ApprovDocumentVo> selectCoopList(SqlSessionTemplate sst, String empNo);

	//미확인 참조문서 목록 호출
	List<ApprovDocumentVo> selectReferList(SqlSessionTemplate sst, String empNo);

	//회원 목록 조회
	List<MemberVo> selectMemberList(SqlSessionTemplate sst);

}
