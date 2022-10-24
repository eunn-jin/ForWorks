package com.kh.forworks.community.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forworks.PageVo;
import com.kh.forworks.community.vo.CommunityVo;
import com.kh.forworks.communityattachments.vo.CommunityAttachmentsVo;

@Repository
public class CommunityDaoImpl implements CommunityDao{

	//커뮤니티 전체 갯수
	@Override
	public int selectTotalCount(SqlSessionTemplate sst) {
		return sst.selectOne("communityMapper.selectTotalCount");
	}
	public int selectDp(SqlSessionTemplate sst) {
		return sst.selectOne("communityMapper.selectDp");
	}
	//커뮤니티 리스트 가져오기
	@Override
	public List<CommunityVo> selectList(SqlSessionTemplate sst, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pv.getBoardLimit()); 
		
		return sst.selectList("communityMapper.selectList", null, rb);
	}
	@Override
	public List<CommunityVo> selectListdp(SqlSessionTemplate sst, PageVo pvdp) {
		int offset = (pvdp.getCurrentPage()-1) * pvdp.getBoardLimit();
        RowBounds rb = new RowBounds(offset , pvdp.getBoardLimit()); 
        return sst.selectList("communityMapper.selectListdp", null, rb);
	}
	
	//커뮤니티 글작성
	@Override
	public int insertCm(SqlSessionTemplate sst, CommunityVo cmuvo) {
		return sst.insert("communityMapper.insertCm",cmuvo);
	}
	//커뮤니티 (파일)작성
	@Override
	public int insertCmAt(SqlSessionTemplate sst, CommunityAttachmentsVo cmatVo) {
		return sst.insert("communityMapper.insertCmAt",cmatVo);
	}
	
	//커뮤글 조회수 증가
	@Override
	public int increaseCnt(SqlSessionTemplate sst, String no) {
		return sst.update("communityMapper.increaseCnt",no);
	}
	
	//커뮤글 정보가져오기
	@Override
	public CommunityVo selectOne(SqlSessionTemplate sst, String no) {
		return sst.selectOne("communityMapper.selectOne",no);
	}
	
	//커뮤글 첨부파일 확인
	@Override
	public CommunityAttachmentsVo checkFile(SqlSessionTemplate sst, String no) {
		return sst.selectOne("communityMapper.checkFile", no);
	}
	
	//커뮤 글수정
	@Override
	public int editCm(SqlSessionTemplate sst, CommunityVo cmuvo) {
		return sst.update("communityMapper.editCm", cmuvo);
	}
	//커뮤 파일 수정
	@Override
	public int editCmat(SqlSessionTemplate sst, CommunityAttachmentsVo cmatVo) {
		return sst.update("communityMapper.editCmat", cmatVo);
	}
	
	//커뮤 글삭제
	@Override
	public int delete(SqlSessionTemplate sst, String no) {
		return sst.update("communityMapper.delete",no);
	}


}