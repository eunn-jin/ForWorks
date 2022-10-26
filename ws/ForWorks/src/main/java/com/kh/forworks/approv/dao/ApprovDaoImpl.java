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
	
	//결재문서 생성
	@Override
	public int insertApprovDoc(SqlSessionTemplate sst, ApprovDocumentVo vo) {
		// TODO Auto-generated method stub
		return sst.insert("approvMapper.insertApprovDoc", vo);
	}
	
	//작성한 문서 번호 조회
	@Override
	public int selectDocNoOneByContent(SqlSessionTemplate sst, ApprovDocumentVo vo) {
		// TODO Auto-generated method stub
		return sst.selectOne("approvMapper.selectDocNoOneByContent", vo);
	}
	
	//전자결재자 삽입
	@Override
	public int insertDocApprove(SqlSessionTemplate sst, ApprovDocumentVo vo) {
		// TODO Auto-generated method stub
		return sst.insert("approvMapper.insertDocApprove",vo);
	}
	
	//문서협조자 삽입
	@Override
	public int insertDocCoop(SqlSessionTemplate sst, ApprovDocumentVo vo) {
		// TODO Auto-generated method stub
		return sst.insert("approvMapper.insertDocCoop",vo);
	}
	
	//문서 참조자 삽입
	@Override
	public int insertDocRefer(SqlSessionTemplate sst, ApprovDocumentVo vo) {
		// TODO Auto-generated method stub
		return sst.insert("approvMapper.insertDocRefer",vo);
	}
	
	//문서 첨부파일 삽입
	@Override
	public int insertDocFile(SqlSessionTemplate sst, ApprovDocumentVo vo) {
		// TODO Auto-generated method stub
		return sst.insert("approvMapper.insertDocRefer",vo);
	}

	
}
