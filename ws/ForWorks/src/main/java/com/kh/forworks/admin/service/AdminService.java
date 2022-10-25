package com.kh.forworks.admin.service;

import java.util.List;

import com.kh.forworks.admin.vo.AdminVo;
import com.kh.forworks.admin.vo.CorpInfoVo;
import com.kh.forworks.member.vo.MemberVo;

public interface AdminService {

	AdminVo login(AdminVo vo);

	List<CorpInfoVo> selectPosList();
	
	List<CorpInfoVo> selectDeptList();
	
	List<MemberVo> selectApplyList();
	
	int memberApprove(MemberVo vo);

	int deleteApply(String empNo);


}
