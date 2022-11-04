package com.kh.forworks.docmanage.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.PageVo;
import com.kh.forworks.docmanage.vo.DfileVo;
import com.kh.forworks.docmanage.vo.DocVo;

@Repository
public class DocmanageDaoImpl implements DocmanageDao {
	//일반문서 작성
	@Override
	public int insertDoc(SqlSessionTemplate sst, DocVo dv) {
		return sst.insert("docMapper.insertDoc",dv);
	}
	//일반문서 리스트
	@Override
	public List<DocVo> selectDoc(SqlSessionTemplate sst) {
		return sst.selectList("docMapper.selectDoc");
	}
	//일반문서>파일업로드
	@Override
	public int insertDocFile(SqlSessionTemplate sst, DfileVo fv) {
		return sst.insert("docMapper.insertFile" , fv);
	}
	//전체 문서갯수조회
	@Override
	public int selectCountAll(SqlSessionTemplate sst, String empNo) {
		return sst.selectOne("docMapper.selectCountAll" , empNo);
	}
	//문서관리 리스트
	@Override
	public List<DocVo> selectDocByEmp(SqlSessionTemplate sst , HashMap map) {
		PageVo pv =	(PageVo) map.get("pv");
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		String empNo = (String) map.get("empNo");
		return sst.selectList("docMapper.selectDocByEmp" , empNo , rb);
	}
	//문서관리 디테일
	@Override
	public DocVo selectOneDoc(SqlSessionTemplate sst, String no) {
		return sst.selectOne("docMapper.selectOneDoc" , no);
	}
	//공개범위 받아오기
	@Override
	public HashMap<String, Object> selectRange(SqlSessionTemplate sst) {
		return (HashMap<String, Object>) sst.selectList("docMapper.selectRange");
	}

}
