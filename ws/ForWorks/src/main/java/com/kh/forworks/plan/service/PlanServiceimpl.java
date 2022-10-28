/*package com.kh.forworks.plan.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forworks.plan.dao.PlanDao;
  
@Service("PlanService")
public class PlanServiceimpl implements PlanService {
	
	//db받기
	private final SqlSessionTemplate forworks;
	
	private final PlanDao dao;
	
	@Autowired
	public PlanServiceImpl(SqlSessionTemplate forworks, PlanDao dao) {
		this.forworks = forworks;
		this.dao = dao;
	}
	 
	@Override
	public List<Plan> getPlan() throws Exception {
		return Plandao.getPlan();
	}
}*/
