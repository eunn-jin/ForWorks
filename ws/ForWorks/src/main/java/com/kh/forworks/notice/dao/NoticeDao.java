package com.kh.forworks.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.PageVo;
import com.kh.forworks.notice.vo.NoticeVo;
import com.kh.forworks.noticeattachments.vo.NoticeAttachmentsVo;

public interface NoticeDao {

	//공지사항 갯수 조회
	int selectTotalCount(SqlSessionTemplate sst);
	
	//공지사항 리스트조회
	List<NoticeVo> selectList(SqlSessionTemplate sst, PageVo pv);
	
	//공지사항 상세조회
	NoticeVo selectOne(SqlSessionTemplate sst, String no);
	//공지사항 조회수 증가
	int increaseCnt(SqlSessionTemplate sst, String no);
	
	//공지사항 작성
	int insertNotice(SqlSessionTemplate sst, NoticeVo ntvo);
	//공지사항 작성(파일)
	int insertNtAt(SqlSessionTemplate sst, NoticeAttachmentsVo ntatVo);


}
