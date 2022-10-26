package com.kh.forworks.address.service;

import java.util.List;

import com.kh.forworks.PageVo;
import com.kh.forworks.address.vo.AddressVo;
import com.kh.forworks.member.vo.MemberVo;

public interface AddressService {

	int updateStatus(MemberVo vo);
	
	int editFavoriteMember(MemberVo vo, String stat);
	
	int selectListCnt(AddressVo addVo);
	
	List<MemberVo> addressAllList(PageVo pv, AddressVo addVo);




}
