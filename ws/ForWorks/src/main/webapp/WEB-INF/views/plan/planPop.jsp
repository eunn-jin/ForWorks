<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 등록</title>
</head>
<body>
<div class = "group" id = "popupGroup">	
	<div class = "group-head">
		<h1 class = "top"> 일정 등록</h1>
	</div>
	<div class = "group-body">
	<form id = "scheduleData">
		<div class = "top">
			<input class = "title" id = "title" type = "text" name = "subject" placeholder="제목을 입력하세요">
		</div>
		<div class = "con">
			<textarea class = "memo" id = "memo" name = "memo" rows = "20" cols = "20" placeholder="내용 입력"></textarea> 
		</div>
		<div class = "dateStart">
			<h3>시작일</h3>			
		</div>
			<input type="date" data-placeholder="시작일" required>
		<div class = "dateEnd">
			<h3>종료일</h3>
		</div>
			 <input type="date" data-placeholder="종료일" required>	
	</form>
		<button class = "ok-button" type= "button" onclick="click_ok();">등록</button>
	</div>	
</div>
</body>
</html>