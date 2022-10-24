package com.kh.forworks.approv.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.approv.dao.ApprovDao;
import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.approv.vo.DocFormVo;

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
		// TODO Auto-generated method stub
		return dao.selectApprovList(sst, empNo);
	}

	//미확인 협조문서 목록 호출
	@Override
	public List<ApprovDocumentVo> selectCoopList(String empNo) {
		// TODO Auto-generated method stub
		return dao.selectCoopList(sst, empNo);
	}

	//미확인 참조문서 목록 호출
	@Override
	public List<ApprovDocumentVo> selectReferList(String empNo) {
		// TODO Auto-generated method stub
		return dao.selectReferList(sst, empNo);
	}

	//양식 목록 호출
	@Override
	public List<DocFormVo> selectFormList() {
		// TODO Auto-generated method stub
		return null;
	}

	//전자문서 생성
	@Override
	public int insertApprovDoc(ApprovDocumentVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	//전자문서 결재
	@Override
	public int updateApprov(String dno) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
