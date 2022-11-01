package com.kh.forworks.vote.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.PageVo;
import com.kh.forworks.department.vo.DepartmentVo;
import com.kh.forworks.member.vo.MemberVo;
import com.kh.forworks.vote.vo.VoteAttachmentsVo;
import com.kh.forworks.vote.vo.VoteVo;

public interface VoteDao {
	
	//부서정보 가져오기
	List<DepartmentVo> selectAlldp(SqlSessionTemplate sst);
	
	//전체
	int selectTotalCount(SqlSessionTemplate sst);
	List<VoteVo> selectList(SqlSessionTemplate sst, PageVo pv);
	
	//진행중
	int selecting(SqlSessionTemplate sst);
	List<VoteVo> selectListing(SqlSessionTemplate sst, PageVo pving);

	//마감
	int selectEnd(SqlSessionTemplate sst);
	List<VoteVo> selectListEnd(SqlSessionTemplate sst, PageVo pvend);
	
	//투표 내용 저장
	int insertVt(SqlSessionTemplate sst, VoteVo vtvo);
	//첨부파일 내용 저장
	int insertVtat(SqlSessionTemplate sst, VoteAttachmentsVo vtatVo);
	//투표 항목 저장
	int insertVtcg(SqlSessionTemplate sst, String vtct);
	
	//모든 회원 정보 가져오기
	List<MemberVo> mListAll(SqlSessionTemplate sst);
	//회원 대상자 저장
	int insertVtpt(SqlSessionTemplate sst, MemberVo memberVo);
	
	//부서 회원정보 가져오기
	List<MemberVo> mListDp(SqlSessionTemplate sst, int dept);
	//선택 부서 대상자 저장
	//int insertVtpt(SqlSessionTemplate sst, MemberVo memberVo);

	

	

}
