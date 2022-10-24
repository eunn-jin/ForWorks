package com.kh.forworks.community.service;

import java.util.List;

import com.kh.forworks.PageVo;
import com.kh.forworks.community.vo.CommunityVo;
import com.kh.forworks.communityattachments.vo.CommunityAttachmentsVo;
import com.kh.forworks.noticeattachments.vo.NoticeAttachmentsVo;

public interface CommunityService {
	
	//커뮤니티 전체 갯수
	int selectTotalCount();
	int selectDp();
	//커뮤니티 리스트 가져오기
	List<CommunityVo> selectList(PageVo pv);
	List<CommunityVo> selectListdp(PageVo pvdp);
	
	//커뮤니티글 작성
	int insertCommu(CommunityVo cmuvo, CommunityAttachmentsVo cmatVo);
	
	//커뮤니티글 상세정보 확인
	CommunityVo selectOne(String no);
	//커뮤글 첨부파일 여부 확인
	CommunityAttachmentsVo checkFile(String no);
	
	//커뮤글 수정
	int edit(CommunityVo cmuvo, CommunityAttachmentsVo cmatVo, String no);

	//커뮤글 삭제
	int delete(String no);
	

}
