package com.kh.forworks.plan.dao;

import java.util.List;

import com.kh.forworks.plan.dto.PlanDto;

public interface PlanDao {
	
	
	public List<PlanDto> showSchedule(String id) throws Exception;
	
	public void addSchedule(PlanDto dto) throws Exception;

}
