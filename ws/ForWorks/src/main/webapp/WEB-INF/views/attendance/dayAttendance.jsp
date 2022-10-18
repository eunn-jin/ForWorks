<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>일일근태</title>
</head>

<style>
	
	.multi-card {
		display: flex;
	    flex-wrap: wrap;
		justify-content: space-around;
    }
    
    #clock {
    	text-align: center;
		font-size: 1.5rem;
    	font-weight:700;
		color: #6f42c1;
		margin: 7px 15px;
    }

	.align-center {
    	text-align: center;
	}

	.flex-col {
		display: flex;
		flex-direction: column;
		justify-content: space-around;
	}

	.work-progress {
		display: flex;
	    flex-wrap: wrap;
		justify-content: flex-end;
	}

	.text-part {
		padding-right: 15px;
	}

	.pg-part {
		width: 200px;
	}
	
	.page-heading .page-title .text-subtitle{margin-bottom: 0.3rem;}

	.flex-row-side {
		display: flex;
		justify-content: space-between;
	}

	.flex-row {
		display: flex;
		justify-content: space-around;
	}

</style>

<body>
<div id="app">

	<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>

	<div id="main">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>

		<div class="page-heading">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last mb-3">
						<p class="text-subtitle">근태관리</p>
						<h3>일일근태 등록</h3>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="multi-card">
					<div class="card">
						<div class="card-body">
							<div id="clock">clock</div>
							<div class="multi-card">
								<div class="align-center">
									<div class="mt-3 mb-2">
										<span>출근&ensp;</span>
										<span> 00 : 00 </span>
									</div>
									<button class="btn btn-primary btn-sm">출근하기</button>
								</div>
								<div class="align-center">
									<div class="mt-3 mb-2">
										<span>퇴근&ensp;</span>
										<span> 00 : 00 </span>
									</div>
									<button class="btn btn-primary btn-sm">퇴근하기</button>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-body flex-col">
							<div class="work-progress">
								<div class="text-part">
									<span>이번 달 근무&ensp;</span>
									<span> 00: 00 </span>
								</div>
								<div class="progress progress-primary pg-part mt-1 mb-2">
									<div class="progress-bar" role="progressbar" style="width: 35%" aria-valuenow="0"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
							<div class="work-progress">
								<div class="text-part">
									<span>이번 주 근무&ensp;</span>
									<span> 00: 00 </span>
								</div>
								<div class="progress progress-primary pg-part mt-1 mb-2">
									<div class="progress-bar" role="progressbar" style="width: 35%" aria-valuenow="0"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
							<div class="work-progress">
								<div class="text-part">
									<span>오늘 근무&ensp;</span>
									<span> 00: 00 </span>
								</div>
								<div class="progress progress-primary pg-part mt-1 mb-2">
									<div class="progress-bar" role="progressbar" style="width: 35%" aria-valuenow="0"
										aria-valuemin="0" aria-valuemax="100"></div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-body">
						<div class="flex-row-side">
							<div class>
								<span class="text-part">근무일자</span>
								<input type="date">
								<button class="btn btn-primary btn-sm">검색</button>
							</div>
							<div>
								<button class="btn btn-outline-primary btn-sm">개인</button>
								<button class="btn btn-outline-primary btn-sm">전체</button>
							</div>
						</div>
						<div class="table-responsive mt-5">
							<table class="table table-bordered mb-0">
								<thead>
									<tr>
										<th>사원이름</th>
										<th>출근시간</th>
										<th>퇴근시간</th>
										<th>근무시간</th>
										<th>지각시간</th>
										<th>조퇴시간</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>조은진</td>
										<td>10:00</td>
										<td>18:00</td>
										<td>08:00</td>
										<td>0</td>
										<td>0</td>
										<td>정상 출근</td>		
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</section>
		</div>
		
    </div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</body>
<script>
	
	$().ready(function() {
		$('#att-day').addClass("active");
		$('#att-part').css("display", "block");
	});
	
</script>
<script>
	var Target = document.getElementById("clock");
	function clock() {
	    var time = new Date();
	
	    var year = time.getFullYear();
	    var month = ('0' + (time.getMonth() + 1)).slice(-2);
	    var date = ('0' + time.getDate()).slice(-2);
	    var day = time.getDay();
	    var week = ['일', '월', '화', '수', '목', '금', '토'];

	    var dateString = year + '/' + month  + '/' + date;
	
	    var hours = ('0' + time.getHours()).slice(-2); 
	    var minutes = ('0' + time.getMinutes()).slice(-2);
	    var seconds = ('0' + time.getSeconds()).slice(-2); 

	    var timeString = hours + ':' + minutes  + ':' + seconds;
	
	    Target.innerText = dateString + ' (' +week[day] +') '+ timeString;
	}
	clock();
	setInterval(clock, 1000);
</script>
</html>