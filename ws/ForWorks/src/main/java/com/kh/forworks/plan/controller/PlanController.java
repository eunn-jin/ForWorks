package com.kh.forworks.plan.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.forworks.plan.dto.PlanDto;
import com.kh.forworks.plan.service.PlanService;
import com.kh.forworks.plan.vo.PlanVo;

@Controller
public class PlanController {
//일정 캘린더 화면 보여주기

	@GetMapping("plan/calendar")
	public String calendar(Model model) {
		//voList = service.selectist();
		//model.addAttribute("list", voList);
		return "plan/calendar";
	}
	
	
@Inject
private PlanService service;

//일정 추가 버튼 클릭 Ajax		
	@ResponseBody
	@RequestMapping(value = "/addSchedule", method = RequestMethod.POST)
	public Map<Object,Object> addSchedule(@RequestBody PlanDto dto) throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();

		service.addSchedule(dto);

		return map;
	}

	@RequestMapping(value = "/plan")
	public String schedule(Model model)throws Exception {

		model.addAttribute("showSchedule" , service.showSchedule());
	    
		return "plan/calendar";
	}
		}
		
		
	







	
	
	
	
	

	