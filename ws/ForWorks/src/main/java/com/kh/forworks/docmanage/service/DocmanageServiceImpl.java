package com.kh.forworks.docmanage.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.docmanage.dao.DocmanageDao;
import com.kh.forworks.docmanage.vo.DfileVo;
import com.kh.forworks.docmanage.vo.DocVo;
import com.kh.forworks.member.vo.MemberVo;

@Service
public class DocmanageServiceImpl implements DocmanageService{

	private final DocmanageDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public DocmanageServiceImpl(DocmanageDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	//일반문서 작성
	@Override
	public int write(DocVo dv,DfileVo df) {
		int result = 0;
		int result1 = 1;
		result = dao.insertDoc(sst,dv);
		if(result == 1) {
			result = dao.insertDocControl(sst,dv);
		}
		if(!dv.getFile()[0].isEmpty()) {
			result1 = dao.insertDocFile(sst, df);			
		}
		return result = result*result1; 
	}
	//일반문서 리스트
	@Override
	public List<DocVo> selectRangeDoc(String range) {
		int a = dao.updateRange(sst);
		System.out.println(a);
		List<DocVo> vo = dao.selectRangeDoc(sst,range);
		System.out.println(vo);
		return vo;
	}
	//전체 문서갯수조회
	@Override
	public int selectTotalCnt(String empNo) {
		return dao.selectCountAll(sst,empNo);
	}
	//문서관리 리스트
	@Override
	public List<DocVo> selectDocByEmp(HashMap map) {
		return dao.selectDocByEmp(sst,map);
	}
	//문서관리 디테일
	@Override
	public DocVo selectOneDoc(String no) {
		return dao.selectOneDoc(sst ,no);
	}
	//공개범위 받아오기
	@Override
	public List<MemberVo> selectDept() {
		return (List<MemberVo>) dao.selectDept(sst);
	}
	//전체 문서갯수조회(range)
	@Override
	public int selectRangeTotalCnt(String range) {
		return dao.selectRangeCountAll(sst, range);
	}
	
	
}
