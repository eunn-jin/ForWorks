package com.kh.forworks.plan.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.forworks.plan.dto.PlanDto;

@Repository
public class PlanDaoImpl implements PlanDao {
	

		@Inject
		private SqlSession sqlSession;

		private static final String namespace = "com.management.schedule.ScheduleDAO";
		
		public List<PlanDto> showSchedule(String id) throws Exception {
			return sqlSession.selectList(namespace + ".showSchedule", id);
		}
		
		public void addSchedule(PlanDto dto) throws Exception  {
			sqlSession.insert(namespace + ".addSchedule", dto);
		}
	}
			



