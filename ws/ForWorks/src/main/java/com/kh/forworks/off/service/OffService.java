package com.kh.forworks.off.service;

import java.util.List;
import java.util.Map;

import com.kh.forworks.off.vo.OffCntVo;
import com.kh.forworks.off.vo.OffVo;

public interface OffService {

	OffCntVo getOffCnt(int empNo);

	List<OffVo> getOffList(Map<String, Object> map);

}
