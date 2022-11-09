package com.kh.forworks.docmanage.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.PageVo;
import com.kh.forworks.approv.vo.ApprovDocumentVo;
import com.kh.forworks.docmanage.dao.AppDocmanageDao;
import com.kh.forworks.docmanage.vo.DocControlVo;
import com.kh.forworks.member.vo.MemberVo;

@Service
public class AppDocmanageServiceImpl implements AppDocmanageService{
	private final AppDocmanageDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public AppDocmanageServiceImpl(AppDocmanageDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	//부서 불러오기
	@Override
	public List<MemberVo> selectDept() {
		return dao.selectDept(sst);
	}
	//해당직원의 전자결재문서 받아오기
	@Override
	public List<ApprovDocumentVo> selectDocByEmp(HashMap map) {
		return dao.selectDocByEmp(sst,map);
	}
	//문서하나불러오기
	@Override
	public ApprovDocumentVo selectOneDoc(String adocNo) {
		return dao.selectOneDoc(sst,adocNo);
	}
	//결재문서관리등록
	@Override
	public int insertDocCont(DocControlVo vo) {
		return dao.insertDocCont(sst,vo);
	}
	//해당직원이 작성한 총갯수
	@Override
	public int selectTotalCnt(String empNo) {
		return dao.selectTotalCnt(sst,empNo);
	}
	//문서관리등록한 결재문서보기
	@Override
	public List<DocControlVo> selectContDocByEmp(HashMap map) {
		return dao.selectContDocByEmp(sst,map);
	}
	//게시상태수정
	@Override
	public int updateStatus(DocControlVo vo) {
		return dao.updateStatus(sst,vo);
	}
	//결재문서관리등록한 문서불러오기
	@Override
	public DocControlVo selectContDetail(String no) {
		return dao.selectContDetail(sst,no);
	}
	//결재문서등록 공개리스트
	@Override
	public List<DocControlVo> selectContDocList(PageVo pv) {
		return dao.selectContDocList(sst,pv);
	}
}
