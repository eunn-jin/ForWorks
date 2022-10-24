package com.kh.forworks.address.service;

import java.util.List;

import com.kh.forworks.PageVo;
import com.kh.forworks.member.vo.MemberVo;

public interface AddressService {

	int selectListCnt();
	
	List<MemberVo> addressAllList(PageVo pv);


}
