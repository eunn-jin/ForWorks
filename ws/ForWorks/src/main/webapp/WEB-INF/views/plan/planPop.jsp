<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
	<title>일정 등록</title>
</head>

<style>
	body, html{
	margin:0;
	padding:0;
	font-weight:600;
	font-size:16px;
	}
	a{
	text-decoration:none;
	}
	/*팝업창 본 내용*/
	.pj_popup{
	width:700px;
	background:#eef1ff;
	padding:84px 36px 38px;
	position: relative;
	}
	.popup_name{
	position: absolute;
	left:15px;
	top:20px;}
	.pj_c_block{
	width:width:100%;
	background:#fff;
	border-radius:10px;
	padding:18px 30px;
	}
	.pj_top{
	text-align:center;
	}
	.pj_name{
	background:#F5F5F5;
	border:1px solid #6F5CFA;
	padding:20px 15px;
	color:#A1A1A1;
	font-size:13px;
	font-weight:600;
	display:block;
	width:95.5%;
	height:50px;
	margin:10px 0;}
	
	/*버튼 설정*/
	.pj_bts{
	margin:8px 0 0;
	}
	
	/*날짜 관련 설정*/
	.pj_fday_eday{
	display:flex;
	justify-content:space-between;
	}
	.pj_fday, .pj_eday{
	width:45%;
	}
	.pj_fday_eday input{
	background:#F5F5F5;
	border:1px solid #6F5CFA;
	padding:8px 5px;
	color:#A1A1A1;
	font-size:13px;
	font-weight:600;
	display:block;
	width:95.5%;
	margin:10px 0;
	}
	/*등록 버튼 설정*/
	.pj_submit{
	margin:8px 0 0;
	text-align: right;
	}
	.pj_submit a{
	background: #6F5CFA;
	color: #FFF;
	border-radius:13px;
	padding:3px 0;
	width:100px;
	display:inline-block;
	text-align:center;
	margin:4px 2px;
	}
	.pj_submit a:hover{
	border:1px solid #6F5CFA;
	background: #FFF;
	color:#000;
	}
	.pj_submit .on{
	border:1px solid #6F5CFA;
	background: #FFF;
	color:#000;
	}	
</style>


<body>
	<div class="pj_popup">
		<div class="popup_name">일정등록</div>
		<div class="pj_c_block">
			<div class="pj_top">일정 등록</div>
			<div class="pj_title"><input type="text" placeholder="일정 제목을 입력하세요." style="border: none; background: transparent;"></div>
				<input type="text" class="pj_name" placeholder="내용 입력">

			<div class="pj_fday_eday">
				<div class="pj_fday">
					시작일 <a href="" class="calendar"><img src="calendar.svg"></a>
					<input type="text" placeholder="시작일을 선택해주세요.">
				</div>

				<div class="pj_eday">
					종료일 <a href="" class="calendar"><img src="calendar.svg"></a>
					<input type="text" placeholder="종료일을 선택해주세요.">
				</div>
			</div>
			<div class="pj_submit">
				<a href="">등록</a>
				<a href="">취소</a>
			</div>
		</div>
	</div>
</body>