package com.kh.forworks.plan.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;



import com.kh.forworks.plan.dao.PlanDao;
import com.kh.forworks.plan.dto.PlanDto;
  
@Service
public class PlanServiceimpl implements PlanService {
	
	@Inject
	private PlanDao dao;
	
	@Override
	public List<PlanDto> showSchedule() throws Exception {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		return dao.showSchedule(id);
	}
	
	@Override
	public void addSchedule(PlanDto dto) throws Exception{


		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String id = auth.getName();
		
		dto.setName(id);
		
		dao.addSchedule(dto);
	}
	
	
	}





	

