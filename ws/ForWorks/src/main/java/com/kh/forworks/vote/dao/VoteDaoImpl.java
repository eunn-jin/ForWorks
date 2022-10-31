package com.kh.forworks.vote.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.PageVo;
import com.kh.forworks.department.vo.DepartmentVo;
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
}
