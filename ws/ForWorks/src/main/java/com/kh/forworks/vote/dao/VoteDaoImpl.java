package com.kh.forworks.vote.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.PageVo;
import com.kh.forworks.department.vo.DepartmentVo;
import com.kh.forworks.member.vo.MemberVo;
import com.kh.forworks.vote.vo.VoteAttachmentsVo;
import com.kh.forworks.vote.vo.VoteVo;

@Repository
public class VoteDaoImpl implements VoteDao{
	
	public RowBounds rb(PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset , pv.getBoardLimit()); 
		return rb;
	} 
	
	//부서 정보가져오기
	@Override
	public List<DepartmentVo> selectAlldp(SqlSessionTemplate sst) {
		return sst.selectList("voteMapper.selectAlldp");
	}
	
	//투표 리스트
	//전체
	@Override
	public int selectTotalCount(SqlSessionTemplate sst) {
		return sst.selectOne("voteMapper.selectTotalCount");
	}

	@Override
	public List<VoteVo> selectList(SqlSessionTemplate sst, PageVo pv) {
		
		return sst.selectList("voteMapper.selectList", null, rb(pv));
	}

	//진행중
	@Override
	public int selecting(SqlSessionTemplate sst) {
		return sst.selectOne("voteMapper.selecting");
	}

	@Override
	public List<VoteVo> selectListing(SqlSessionTemplate sst, PageVo pving) {
		return sst.selectList("voteMapper.selectListing",null,rb(pving));
	}
	
	//마감
	@Override
	public int selectEnd(SqlSessionTemplate sst) {
		return sst.selectOne("voteMapper.selectEnd");
	}

	@Override
	public List<VoteVo> selectListEnd(SqlSessionTemplate sst, PageVo pvend) {
		return sst.selectList("voteMapper.selectListEnd", null, rb(pvend));
	}
	//----------------------------------------------------------------------
	//투표 내용 저장
	@Override
	public int insertVt(SqlSessionTemplate sst, VoteVo vtvo) {
		return sst.insert("voteMapper.insertVt", vtvo);
	}
	//첨부파일 내용 저장
	@Override
	public int insertVtat(SqlSessionTemplate sst, VoteAttachmentsVo vtatVo) {
		return sst.insert("voteMapper.insertVtat", vtatVo);
	}
	//투표 항목 저장
	@Override
	public int insertVtcg(SqlSessionTemplate sst, String vtct) {
		return sst.insert("voteMapper.insertVtcg", vtct);
	}
	
	//모든 회원 정보 가져오기
	@Override
	public List<MemberVo> mListAll(SqlSessionTemplate sst) {
		return sst.selectList("voteMapper.mListAll");
	}
	//회원 대상자 저장
	@Override
	public int insertVtpt(SqlSessionTemplate sst, MemberVo memberVo) {
		return sst.insert("voteMapper.insertVtpt",memberVo.getEmpNo());
	}
	
	//부서 회원정보 가져오기
	@Override
	public List<MemberVo> mListDp(SqlSessionTemplate sst, int dept) {
		return sst.selectList("voteMapper.mListDp", dept);
	}
//	//선택 부서 대상자 저장
//	@Override
//	public int insertVtptDp(SqlSessionTemplate sst, MemberVo memberVo) {
//		return sst.insert("voteMapper.insertVtptDp", memberVo);
//	}
	
}
