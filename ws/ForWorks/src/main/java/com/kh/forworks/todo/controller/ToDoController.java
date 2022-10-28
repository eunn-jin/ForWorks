package com.kh.forworks.todo.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

public class ToDoController {

	@Controller
	//투두리스트 보여주기
	@RequestMapping("todo")
	public class PlanController {
		@GetMapping("newTodo")
		
		public String newTodo () {
			return "todo/newTodo";
		}
		
	}

}
