package com.kh.forworks.off.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.off.dao.OffDao;
import com.kh.forworks.off.vo.OffCntVo;
import com.kh.forworks.off.vo.OffTypeVo;
import com.kh.forworks.off.vo.OffVo;

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

	@Override
	public List<OffVo> getOffList(Map<String, Object> map) {
		return dao.selectOffList(sst, map);
	}

	@Override
	public List<OffTypeVo> getOffTypeList() {
		return dao.selectOffTypeList(sst);
	}

	@Override
	public int submitOff(Map<String, Object> map) {
		return dao.insertOffForm(sst, map);
	}
	
	
}
