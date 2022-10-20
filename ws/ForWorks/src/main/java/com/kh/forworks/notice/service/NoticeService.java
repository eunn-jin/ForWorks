package com.kh.forworks.notice.service;

import java.util.List;

import com.kh.forworks.PageVo;
import com.kh.forworks.notice.vo.NoticeVo;
import com.kh.forworks.noticeattachments.vo.NoticeAttachmentsVo;

public interface NoticeService{

	//공지사항 갯수 조회
	int selectTotalCount();
	
	//공지사항 목록 조회
	List<NoticeVo> selectList(PageVo pv);

	//공지사항 상세조회
	NoticeVo selectOne(String no);
	
	//공지사항 저장
	int insertNotice(NoticeVo ntvo, NoticeAttachmentsVo ntatVo);


}
