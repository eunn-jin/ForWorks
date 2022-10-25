package com.kh.forworks.plan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlanController {
	
	@RequestMapping(value={"/", "plan"})
		public String Plan() {
			return "plan";
	}

}
