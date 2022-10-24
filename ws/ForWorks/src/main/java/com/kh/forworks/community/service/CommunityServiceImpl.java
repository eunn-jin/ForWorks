package com.kh.forworks.community.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.PageVo;
import com.kh.forworks.community.dao.CommunityDao;
import com.kh.forworks.community.vo.CommunityVo;
import com.kh.forworks.communityattachments.vo.CommunityAttachmentsVo;

@Service
public class CommunityServiceImpl implements CommunityService{
	
	private final CommunityDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public CommunityServiceImpl(CommunityDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//커뮤니티 전체 갯수
	@Override
	public int selectTotalCount() {
		return dao.selectTotalCount(sst);
	}
	@Override
	public int selectDp() {
		return dao.selectDp(sst);
	}
	
	//커뮤니티 리스트 가져오기
	@Override
	public List<CommunityVo> selectList(PageVo pv) {
		return dao.selectList(sst, pv);
		
	}
	@Override
	public List<CommunityVo> selectListdp(PageVo pvdp) {
		return dao.selectListdp(sst, pvdp);
	}


	//커뮤니티 글 작성
	@Override
	public int insertCommu(CommunityVo cmuvo, CommunityAttachmentsVo cmatVo) {

		int result1 = dao.insertCm(sst, cmuvo);
		
		int result2 = 0;
		if (cmatVo != null) {
			result2 = dao.insertCmAt(sst, cmatVo);
		}
		return result1+result2;
	}
	
	//커뮤상세글 보기
	@Override
	public CommunityVo selectOne(String no) {
		//글 조회수증가
		int result = dao.increaseCnt(sst,no);
		
		if (result == 1) {
			return dao.selectOne(sst, no);
		}else {return null;}		
	}
	//커뮤글 파일 첨부여부
	@Override
	public CommunityAttachmentsVo checkFile(String no) {
		return dao.checkFile(sst, no);
	}
	
	//커뮤글 수정
	@Override
	public int edit(CommunityVo cmuvo, CommunityAttachmentsVo cmatVo, String no) {
		
		//글 수정
		int result1 = dao.editCm(sst, cmuvo);
		
		//파일수정
		int result2 = 0;
		if (cmatVo != null) {
			result2 = dao.editCmat(sst, cmatVo);
		}
		return result1 + result2;
	}
	
	//커뮤 글삭제
	@Override
	public int delete(String no) {
		return dao.delete(sst,no);
	}
	
	
}
