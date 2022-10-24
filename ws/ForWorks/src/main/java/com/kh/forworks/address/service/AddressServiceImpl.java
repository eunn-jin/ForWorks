package com.kh.forworks.address.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.forworks.PageVo;
import com.kh.forworks.address.dao.AddressDao;
import com.kh.forworks.member.vo.MemberVo;

@Service
public class AddressServiceImpl implements AddressService {
	
	private final AddressDao addressDao;
	
	private final SqlSessionTemplate sst;
	
	public AddressServiceImpl(SqlSessionTemplate sst, AddressDao addressDao) {
		this.addressDao = addressDao;
		this.sst = sst;
	}

	@Override
	public int selectListCnt() {
		return addressDao.selectCountAll(sst);
	}

	@Override
	public List<MemberVo> addressAllList(PageVo pv) {
		return addressDao.selectAllMember(sst, pv);
	}

}
