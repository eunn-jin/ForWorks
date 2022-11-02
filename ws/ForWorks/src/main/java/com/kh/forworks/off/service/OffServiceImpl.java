package com.kh.forworks.off.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.off.dao.OffDao;
import com.kh.forworks.off.vo.OffCntVo;

@Service
public class OffServiceImpl implements OffService {

	private final OffDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public OffServiceImpl(SqlSessionTemplate sst, OffDao dao) {
		this.sst = sst;
		this.dao = dao;
	}

	@Override
	public OffCntVo getOffCnt(int empNo) {
		
		OffCntVo vo = new OffCntVo();
		vo.setTotalOff(dao.getTotalOff(sst, empNo));
		vo.setUseOff(dao.getUseOff(sst, empNo));
		vo.addHalfOff(dao.getUseHalfOff(sst, empNo));
		vo.setLeftOff();
		return vo;
	}
	
	
}
