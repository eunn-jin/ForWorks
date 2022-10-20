package com.kh.forworks.notice.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.PageVo;
import com.kh.forworks.notice.vo.NoticeVo;
import com.kh.forworks.noticeattachments.vo.NoticeAttachmentsVo;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	//공지사항 갯수 조회
	@Override
	public int selectTotalCount(SqlSessionTemplate sst) {
		return sst.selectOne("noticeMapper.selectTotalCount");
	}
	
	//공지사항 리스트조회
	@Override
	public List<NoticeVo> selectList(SqlSessionTemplate sst, PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv.getBoardLimit()); 
		
		return sst.selectList("noticeMapper.selectList", null, rb);
	}
	
	//공지사항 상세 조회
	@Override
	public NoticeVo selectOne(SqlSessionTemplate sst, String no) {
		return sst.selectOne("noticeMapper.selectOne",no);
	}
	//게시글 조회수 증가
	@Override
	public int increaseCnt(SqlSessionTemplate sst, String no) {
		return sst.update("noticeMapper.increaseCnt",no);
	}

	//공지사항 작성
	@Override
	public int insertNotice(SqlSessionTemplate sst, NoticeVo ntvo) {
		return sst.insert("noticeMapper.insertNotice", ntvo);
	}
	//공지사항 작성(파일)
	@Override
	public int insertNtAt(SqlSessionTemplate sst, NoticeAttachmentsVo ntatVo) {
		return sst.insert("noticeMapper.insertNtAt", ntatVo);
	}


}
