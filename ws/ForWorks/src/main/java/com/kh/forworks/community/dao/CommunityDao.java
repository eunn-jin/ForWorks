package com.kh.forworks.community.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.PageVo;
import com.kh.forworks.community.vo.CommunityVo;
import com.kh.forworks.communityattachments.vo.CommunityAttachmentsVo;

public interface CommunityDao {

	//커뮤니티 전체 갯수
	int selectTotalCount(SqlSessionTemplate sst);
	int selectDp(SqlSessionTemplate sst);
	//커뮤니티 리스트 가져오기
	List<CommunityVo> selectList(SqlSessionTemplate sst, PageVo pv);
	List<CommunityVo> selectListdp(SqlSessionTemplate sst, PageVo pvdp);
	
	//커뮤니티 글작성
	int insertCm(SqlSessionTemplate sst, CommunityVo cmuvo);
	//커뮤니티 (파일)작성
	int insertCmAt(SqlSessionTemplate sst, CommunityAttachmentsVo cmatVo);

	//조회수증가
	int increaseCnt(SqlSessionTemplate sst, String no);
	//커뮤글 정보 가져오기
	CommunityVo selectOne(SqlSessionTemplate sst, String no);
	//커뮤글 첨부파일 확인
	CommunityAttachmentsVo checkFile(SqlSessionTemplate sst, String no);
	
	//커뮤 글수정
	int editCm(SqlSessionTemplate sst, CommunityVo cmuvo);
	//파일 수정
	int editCmat(SqlSessionTemplate sst, CommunityAttachmentsVo cmatVo);
	
	//커뮤 글삭제
	int delete(SqlSessionTemplate sst, String no);
	
	

}
