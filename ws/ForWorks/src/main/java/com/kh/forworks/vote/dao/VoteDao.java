package com.kh.forworks.vote.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.forworks.PageVo;
import com.kh.forworks.department.vo.DepartmentVo;
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

}
