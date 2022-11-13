package com.kh.forworks.todo.controller;
import java.util.Scanner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

public class ToDoController {
	
	//todolist 자바 코드. 에러남. 수정 필요
	
	/*public class TodoMain {
		public static void start() {
			Scanner sc = new Scanner(System.in);
			// 투두리스트 객체 만들기
			TodoList l = new TodoList();
			boolean isList = false;
			
		}
		
		//시작할 때, 호출할 메소드. 화면상에 제일 먼저 보여줌.
		Menu.displaymenu();
		do {
			Menu.prompt();
			isList = false;
			String choice = sc.next();
			switch (choice) {
			
			case "add":
				TodoUtil.createItem(l);
				break;
				
			case "delete":
				TodoUtil.deleteItem(l);
				break;
				
			case "edit":
				TodoUtil.updateItem(l);
				break;
				
			case "all":
				TodoUtil.listAll(l);
				break;
				
			case "list_name_asc":
				l.sortByName();
				System.out.println("제목순으로 정렬하였습니다.");
				isList = true;
				break;
				
			case "list_name_dsc":
				l.sortByName();
				l.reverseList();
				System.out.println("제목역순으로 정렬하겠습니다.")
				isList = true;
				break;
				
			case "list_date":
				l.sortByDate();
				System.out.prinln("날짜순으로 정렬하였습니다.")
				isList - true;
				break;
			}
		}
	}*/

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
