package com.kh.forworks.docmanage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.docmanage.vo.DocVo;

public interface DocmanageDao {
	//일반문서작성
	int insertDoc(SqlSessionTemplate sst, DocVo dv);
	//일반문서리스트
	List<DocVo> selectDoc(SqlSessionTemplate sst);

}
