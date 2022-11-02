package com.kh.forworks.docmanage.service;

import java.util.List;

import com.kh.forworks.approv.vo.DocFileVo;
import com.kh.forworks.docmanage.vo.DocVo;

public interface DocmanageService {
	//일반문서 작성
	int write(DocVo dv);
	//일반문서 리스트
	List<DocVo> selectDoc();

}
