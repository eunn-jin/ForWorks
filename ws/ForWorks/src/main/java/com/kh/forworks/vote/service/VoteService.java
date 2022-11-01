package com.kh.forworks.vote.service;

import java.util.List;

import com.kh.forworks.PageVo;
import com.kh.forworks.department.vo.DepartmentVo;
import com.kh.forworks.vote.vo.VoteAttachmentsVo;
import com.kh.forworks.vote.vo.VoteVo;

public interface VoteService {

	//부서정보 가져오기
	List<DepartmentVo> selectAlldp();
	
	//투표 전체 개수
	int selectTotalCount();
	//투표 전체 리스트
	List<VoteVo> selectList(PageVo pv);
	
	//진행중
	//투표 개수
	int selecting();
	//리스트
	List<VoteVo> selectListing(PageVo pving);

	//마감
	//개수
	int selectEnd();
	//리스트
	List<VoteVo> selectListEnd(PageVo pvend);

	//투표생성
	int insertVote(VoteVo vtvo, String[] vtcgArr, VoteAttachmentsVo vtatVo);
	

}
