package com.kh.forworks.address.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.forworks.PageVo;
import com.kh.forworks.address.dao.AddressDao;
import com.kh.forworks.address.vo.AddressVo;
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
	public int updateStatus(MemberVo vo) {
		return addressDao.updateEmpStatByNo(sst, vo);
	}
	
	@Override
	public int editFavoriteMember(MemberVo vo, String stat) {
		if ("insert".equals(stat)) {
			return addressDao.insertFavoriteMember(sst, vo);
		} else {
			return addressDao.deleteFavoriteMember(sst, vo);
		}
	}
	
	@Override
	public int selectListCnt(AddressVo addVo) {
		return addressDao.selectCountAll(sst, addVo);
	}

	@Override
	public List<MemberVo> addressAllList(PageVo pv, AddressVo addVo) {
		return addressDao.selectAllMember(sst, pv, addVo);
	}



}
