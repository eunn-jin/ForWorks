package com.kh.forworks.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.forworks.PageVo;
import com.kh.forworks.address.vo.AddressVo;
import com.kh.forworks.admin.dao.AdminDao;
import com.kh.forworks.admin.vo.AdminVo;
import com.kh.forworks.admin.vo.CorpInfoVo;
import com.kh.forworks.member.vo.MemberVo;

@Service
public class AdminServiceImpl implements AdminService {
	
	private final AdminDao adminDao;
	
	private final SqlSessionTemplate sst;
	
	private final PasswordEncoder pwdEnc;
	
	public AdminServiceImpl(SqlSessionTemplate sst, PasswordEncoder pwdEnc, AdminDao adminDao) {
		this.adminDao = adminDao;
		this.sst = sst;
		this.pwdEnc = pwdEnc;
	}

	//관리자 로그인
	@Override
	public AdminVo login(AdminVo vo) {
		AdminVo dbAdmin = adminDao.selectOneById(sst, vo);
		
		if(dbAdmin != null && pwdEnc.matches(vo.getManPwd(), dbAdmin.getManPwd())) {
			return dbAdmin;
		} else {
			return null;
		}
	}

	//직급테이블
	@Override
	public List<CorpInfoVo> selectPosList() {
		return adminDao.selectPosList(sst);
	}
	
	//부서테이블
	@Override
	public List<CorpInfoVo> selectDeptList() {
		return adminDao.selectDeptList(sst);
	}
	
	//구성원 신청목록 조회
	@Override
	public List<MemberVo> selectApplyList() {
		return adminDao.selectApplyList(sst);
	}

	//구성원 승인 (정보입력)
	@Override
	public int memberApprove(MemberVo vo) {
		return adminDao.updateApplyMember(sst, vo);
	}

	//구성원 승인 거절 (삭제)
	@Override
	public int deleteApply(String empNo) {
		return adminDao.deleteMemberByNo(sst, empNo);
	}

	//구성원 목록 갯수
	@Override
	public int selectListCnt(AddressVo addVo) {
		return adminDao.selectListCnt(sst, addVo);
	}

	//구성원 목록 조회
	@Override
	public List<MemberVo> memberList(PageVo pv, AddressVo addVo) {
		return adminDao.selectMemberList(sst, pv, addVo);
	}


}
