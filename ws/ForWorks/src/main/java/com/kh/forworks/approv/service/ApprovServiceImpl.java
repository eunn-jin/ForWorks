package com.kh.forworks.approv.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.approv.dao.ApprovDao;
import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.approv.vo.DocApprovVo;
import com.kh.forworks.approv.vo.DocFormVo;
import com.kh.forworks.approv.vo.DocSignVo;
import com.kh.forworks.member.vo.MemberVo;

@Service
public class ApprovServiceImpl implements ApprovService {
	
	private final ApprovDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public ApprovServiceImpl(ApprovDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	//미결재목록호출
	@Override
	public List<ApprovDocumentVo> selectApprovList(String empNo) {
		return dao.selectApprovList(sst, empNo);
	}

	//미확인 협조문서 목록 호출
	@Override
	public List<ApprovDocumentVo> selectCoopList(String empNo) {
		return dao.selectCoopList(sst, empNo);
	}

	//미확인 참조문서 목록 호출
	@Override
	public List<ApprovDocumentVo> selectReferList(String empNo) {
		return dao.selectReferList(sst, empNo);
	}
	
	//반려문서 목록 호출
	@Override
	public List<ApprovDocumentVo> selectRejectApprovList(String empNo) {
		return dao.selectRejectApprovList(sst, empNo);
	}

	//양식 목록 호출
	@Override
	public List<DocFormVo> selectFormList() {
		// TODO 양식 목록 호출 구현
		return null;
	}

	//전자문서 생성
	@Override
	public int insertApprovDoc(ApprovDocumentVo vo) {
		
		int result = 1;
		
		int result1 = dao.insertApprovDoc(sst, vo);
		
		
		
		result = result*result1;
		System.out.println(vo.getDocFile());
		if(vo.getDocFile().getSize()!=0) {
			result = result*dao.insertDocFile(sst, vo);
		}
		
		if(vo.getApprovMember()!=null) {
		int result2 = dao.insertDocApprove(sst, vo);
		result = result*result2;
		}
		
		if(vo.getCoopMember()!=null) {
		int result3 = dao.insertDocCoop(sst, vo);
		result = result*result3;
		}
		
		if(vo.getReferMember()!=null) {
		int result4 = dao.insertDocRefer(sst, vo);
		result = result*result4;
		}
		
		
		
		return result;
	}

	//전자문서 결재
	@Override
	public int updateApprov(DocApprovVo vo) {
		return dao.updateDocApprov(sst, vo);
	}


	//회원 목록 조회
	@Override
	public List<MemberVo> selectMemberList() {
		return dao.selectMemberList(sst);
	}

	
	//비전자문서 작성
	@Override
	public int insertApprovNoElecDoc(ApprovDocumentVo vo) {
		
		int result1 = dao.insertNoElecApprovDoc(sst,vo);
		
		int result2 = dao.insertNoElecDoc(sst, vo);
		
		return result1*result2;
	}

	//서명 생성
	@Override
	public int insertSignFile(DocSignVo vo) {
		return dao.insertSignFile(sst, vo);
	}

	//서명 선택
	@Override
	public DocSignVo selectSignOne(MemberVo memberVo) {
		return dao.selectSignOne(sst,memberVo);
	}

	//서명 수정
	@Override
	public int updateSignFile(DocSignVo vo) {
		return dao.updateSignFile(sst, vo);
	}

	//문서 세부 확인시 관련자 확인
	@Override
	public int selectApprovDocEmpNo(ApprovDocumentVo vo) {
		return dao.selectApprovDocEmpNo(sst, vo);
	}

	//문서 조회
	@Override
	public ApprovDocumentVo selectApprovDocOneByNo(ApprovDocumentVo vo) {
		return dao.selectApprovDocOneByNo(sst, vo);
	}

	



	
	
	

}
