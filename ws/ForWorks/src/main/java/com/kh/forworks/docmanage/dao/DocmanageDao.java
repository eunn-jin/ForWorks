package com.kh.forworks.docmanage.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.docmanage.vo.DfileVo;
import com.kh.forworks.docmanage.vo.DocVo;

public interface DocmanageDao {
	//일반문서작성
	int insertDoc(SqlSessionTemplate sst, DocVo dv);
	//일반문서리스트
	List<DocVo> selectDoc(SqlSessionTemplate sst);
	//일반문서>파일업로드
	int insertDocFile(SqlSessionTemplate sst, DfileVo fv);
	//전체 문서갯수조회
	int selectCountAll(SqlSessionTemplate sst, String empNo);
	////문서관리 리스트
	List<DocVo> selectDocByEmp(SqlSessionTemplate sst, HashMap map);
	//문서관리 디테일
	DocVo selectOneDoc(SqlSessionTemplate sst, String no);
	//공개범위 받아오기
	HashMap<String, Object> selectRange(SqlSessionTemplate sst);

}
