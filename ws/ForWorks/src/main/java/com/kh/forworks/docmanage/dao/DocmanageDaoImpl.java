package com.kh.forworks.docmanage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.approv.vo.DocFileVo;
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
	public int insertDocFile(SqlSessionTemplate sst, DocFileVo fv) {
		return sst.insert("docMapper.insertFile" , fv);
	}

}
