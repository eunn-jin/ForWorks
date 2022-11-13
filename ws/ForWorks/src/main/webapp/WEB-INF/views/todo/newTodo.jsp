<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<html>
<head>
	<title>TODO리스트</title>
	<meta name="viewport" content="width=device-width, initial-sacle=1,0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
	<link href="stylesheet" href="https://unicons.iconscout.com/release/v4.0./css/line.css">
</head>
<style>
main *{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
 	font-family: 'Noto Serif KR', serif; 
}

body{
	/*전체*/
	overflow: hidden;
	background: #eef1ff;
	
}

.wrapper{
	margin: 135px auto;
	max-width: 405px;
	background: #fff;
	border-radius: 7px;
	padding: 28px 0;
}

.task-input{
	height: 52px;
	padding: 0 25px;
	position: relative;
}

.task-input img{
	position: absolute;
	top: 50%;
	transform: translate(17px, -50%);
}

.task-input input{
	height: 100%;
	width: 100%;
	outline: none;
	font-size: 18px;
	border-radius: 5px;
	border: 1px solid #999;
	padding: 0 20px 0 53px;
}

.task-input input::placeholder{
	color: #bfbfbf;
}

.controls, li{
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.controls{
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 18px 25px;
	border-bottom: 1px solid #ccc;
}

.filters span{
	cursor: pointer;
	margin: 0 8px;
	font-size: 17px;
}

.filters span:first-child{
	margin-left: 0;
}

.filters span.active{
	color:#6F5CFA;
}	

.controls .clear-btn{
	outline: none;
	border: none;
	color: #fff;
	cursor: pointer;
	font-szie: 13px;
	border-radius: 4px;
	padding: 7px 13px;
	backgorund: #6F5CFA;
}

.task-box{
	margin: 20px 25px;
}

.task-box .task{
	list-style: none;
	font-size: 17px;
	margin-bottom: 18px;
	padding-bottom: 16px;
	border-bottom: 1px solid #ccc;
}

.task-box .task:last-child{
	margin-bottom: 0;
	border-bottom: 0;
	padding-bottom: 0;

}

.task label{
	display: flex;
}

.task label p.checked{
	text-decoration: line-through;
}

.task label input{
	margin-top: 6px;
	margin-right: 12px;
}

.task .settings{
	cursor: pointer;
	position: relative;
}

.settings .task-menu{
	position: absolute;
	padding: 5px 0;
	right: -5px;
	bottom: -65px;
	z-index: 2;
	transform: scale(0);
	border-radius: 4px;
	background: #fff;
	transform-origin: top right;
	transition: trnasform 0.2s ease;
	box-shadow: 0 0 6px rgba(0,0,0,0.15);
}

.settings:hover .task-menu{
	transform: scale(1);
}

.task-menu li{
	height: 25px;
	font-size: 16px;
	padding: 17px 15px;
	margin-bottom: 2px;
	justify-content: flex-start;
}

.task-menu li:last-child{
	margin-bottom: 0;
}

.task-menu li:hover{
	background: #f5f5f5;
}

.task-menu li i{
	padding-right: 8px;
}

</style>

<body>
<form action="/todo/newTodo">
<div id="app">
	<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>

	<div id="main">
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        
           
                            <h3>TODO 리스트</h3>
                             <div id="todo"></div>
                           		<div class="wrapper">
                           			<div class="task-input">
										<img src="/resources/img/bars-icon.svg" alt="icon">
										<input type="text" placeholder="새로운 일정을 추가하세요">                            			
                           			</div>
                           			<div class="controls">
                           			<div class="filters">
                           			<span id="all">ALL</span>
                           			<span id="pending">PENDING</span>
                           			<span id="completed">COMPLETED</span>
                           			</div>
                           			<button class="clear-btn">CLEAR ALL</button>
                           			</div>
                           			<ul class="task-box"></ul>
                           		</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
<script>
const taskInput = document.querySelector(".task-input input"),
taskBox = document.querySelector(".task-box");

let todos = JSON.parse(localStorage.getItem("todo-list"));

function showTodo() {
	let li="";
	if(todos){
		todos.forEach((todo, id)) => {
			li += 	'<li class="task">
					<label for="${id}">
						<input type="updateStatus(this)" type="checkbox" id="${id}">
						<p>${todo.name}</p>
					</label>
					<div class="settings">
						<i class="uil uil-ellipsis-h"></i>
						<ul class="task-menu">
							<li><i class="uil uil-pen"></i>수정하기</li>
							<li><i class="uil uil-trash"></i>삭제하기</li>
						</ul>
					</div>
					</li>';
		});
	}
	
	taskBox.innerHTML = li;
}
showTodo();

function updateStatus(selectedTask){
	let taskName = selectedTask.parentElement.lastElementChild;
	if(selectedTask.checked){
		taskName.classList.add("checked");
		todos[selectedTask.id]status = "COMPLETED";
	} else {
		taskName.classList.remove("checked");
		todos[selectedTask.id]status = "PENDING";
	}
	localStorage.setItem("todo-list", JSON.stringify(todos));
}

taskInput.addEventListener("keyup", e=> {
	let userTask = taskInput.value.trim();
	if(e.key =="Enter" && userTask) {
		if(!todos) {
			todos=[];
		}
		taskInput.value = ""; 
		let taskInfo = {name: userTask, status: "pending"};
		todos.push(taskInfo);
		localStorage.setItem("todo-list", JSON.stringify(todos));
		showTodo();
		
	}	
});




</script>
</body>
</html>
