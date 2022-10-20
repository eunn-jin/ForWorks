package com.kh.forworks.notice.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.PageVo;
import com.kh.forworks.notice.dao.NoticeDao;
import com.kh.forworks.notice.vo.NoticeVo;
import com.kh.forworks.noticeattachments.vo.NoticeAttachmentsVo;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	private final NoticeDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public NoticeServiceImpl(NoticeDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	//공지사항 갯수 조회
	@Override
	public int selectTotalCount() {
		return dao.selectTotalCount(sst);
	}


	//공지사항 목록 조회
	@Override
	public List<NoticeVo> selectList(PageVo pv) {
		return dao.selectList(sst, pv);
	}
	
	//공지사항 상세 조회
	@Override
	public NoticeVo selectOne(String no) {
		//게시글 조회수증가
		int result = dao.increaseCnt(sst,no);
		
		if (result == 1) {
			return dao.selectOne(sst, no);
		}else {return null;}
		
		
	}

	//공지사항 저장
	@Override
	public int insertNotice(NoticeVo ntvo, NoticeAttachmentsVo ntatVo) {
		
		System.out.println("서비스:: 파일이름::"+ntvo.getNtFileName());
		//공지사항 테이블에 저장
		int result = dao.insertNotice(sst, ntvo);
		
		int result2=0;
		//파일이 있는경우 
		if (ntvo.getNtFileName() != null) {
			result2 = dao.insertNtAt(sst,ntatVo);
		}
		
		return result*result2;
	}




}
