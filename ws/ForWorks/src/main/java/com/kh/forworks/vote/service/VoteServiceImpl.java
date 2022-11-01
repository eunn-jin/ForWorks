package com.kh.forworks.vote.service;

import java.util.Iterator;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.PageVo;
import com.kh.forworks.department.vo.DepartmentVo;
import com.kh.forworks.member.vo.MemberVo;
import com.kh.forworks.vote.dao.VoteDao;
import com.kh.forworks.vote.vo.VoteAttachmentsVo;
import com.kh.forworks.vote.vo.VoteVo;

@Service
public class VoteServiceImpl implements VoteService{
	
	private final SqlSessionTemplate sst;
	private final VoteDao dao;
	
	@Autowired
	public VoteServiceImpl(SqlSessionTemplate sst, VoteDao dao) {
		this.sst = sst;
		this.dao = dao;
	}
	
	//부서정보 가져오기
	@Override
	public List<DepartmentVo> selectAlldp() {
		return dao.selectAlldp(sst);
	}
	
	//전체
	@Override
	public int selectTotalCount() {
		return dao.selectTotalCount(sst);
	}

	@Override
	public List<VoteVo> selectList(PageVo pv) {
		return dao.selectList(sst, pv);
	}
	
	//진행중
	@Override
	public int selecting() {
		return dao.selecting(sst);
	}

	@Override
	public List<VoteVo> selectListing(PageVo pving) {
		return dao.selectListing(sst, pving);
	}
	
	//마감
	@Override
	public int selectEnd() {
		return dao.selectEnd(sst);
	}

	@Override
	public List<VoteVo> selectListEnd(PageVo pvend) {
		return dao.selectListEnd(sst, pvend);
	}
	
	//투표생성
	@Override
	public int insertVote(VoteVo vtvo, String[] vtcgArr, VoteAttachmentsVo vtatVo) {
		
		int[] result =  new int[4];
		//투표 테이블에 정보 저장
		result[0]=dao.insertVt(sst, vtvo);
		
		//파일 유무 확인후 첨부파일 테이블에 저장
		result[1]=dao.insertVtat(sst, vtatVo);
		
		//항목 
		for (int i = 0; i < vtcgArr.length; i++) {
			System.out.println(vtcgArr[i]);
			//항목개수 만큼 insert작업
			result[2]=dao.insertVtcg(sst,vtcgArr[i]);
		}
		
		//참가인원
		vtvo.getTarget(); //all , dp 인지 판별
		vtvo.getDept();
		
		if (vtvo.getTarget().equals("all")) {
			//all 이면 모든 회원 정보를
			//모든회원정보 가져오기
			List<MemberVo> memberListAll = dao.mListAll(sst);
			//대상자 테이블에 입력
			
			for(int i=0; i<memberListAll.size(); i++ ) {
				result[3]=dao.insertVtpt(sst, memberListAll.get(i));
				if (result[3] != 1) {
					return -1;
				}
			}

		}else if(vtvo.getTarget().equals("dp")) {
			//dp이면 vtvo.getDept()배열안에 있는 부서정보만 
			for (int i = 0; i < vtvo.getDept().length; i++) {
				//부서 정보 리스트 가져오기
				System.out.println(vtvo.getDept()[i]);
				List<MemberVo> memberListDp = dao.mListDp(sst,vtvo.getDept()[i]);
				//가져온 정보 
				for(int j=0; j < memberListDp.size(); j++) {
					result[3]=dao.insertVtpt(sst, memberListDp.get(j));
					if (result[3] != 1) {
						return -2;
					}
				}
				
			}
		}
		
		
		return result[0]*result[1]*result[2]*result[3];
	}
	
	
}
