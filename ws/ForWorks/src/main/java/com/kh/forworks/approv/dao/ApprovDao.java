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

	//결재문서 작성
	int insertApprovDoc(SqlSessionTemplate sst, ApprovDocumentVo vo);

	//작성된 문서 번호 가져오기
	int selectDocNoOneByContent(SqlSessionTemplate sst, ApprovDocumentVo vo);

	//전자결재자 삽입
	int insertDocApprove(SqlSessionTemplate sst, ApprovDocumentVo vo);

	//문서협조자 삽입	
	int insertDocCoop(SqlSessionTemplate sst, ApprovDocumentVo vo);

	//문서참조자 삽입	
	int insertDocRefer(SqlSessionTemplate sst, ApprovDocumentVo vo);

	//문서 첨부파일 삽입
	int insertDocFile(SqlSessionTemplate sst, ApprovDocumentVo vo);

}
