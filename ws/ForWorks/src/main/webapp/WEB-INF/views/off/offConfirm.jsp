<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>휴가신청확인</title>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>

<style>

    .first-card {
        width: 80%;
        margin: auto;
    }

	#demo {
		width: 230px;
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
						<p class="text-subtitle">휴가관리</p>
						<h3>휴가 신청 확인</h3>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="card">
					<div class="card-body">
						<div class="flex-row-side">
							<div class>
								<input type="month">
								<button class="btn btn-primary btn-sm">검색</button>
							</div>
							<div>
								<button class="btn btn-outline-primary btn-sm">휴가 승락</button>
								<button class="btn btn-outline-primary btn-sm">휴가 거절</button>
							</div>
						</div>
						<div class="table-responsive mt-5">
							<table class="table table-bordered mb-0">
								<thead>
									<tr>
										<th>신청인</th>
										<th>신청 날짜</th>
										<th>시작일</th>
										<th>종료일</th>
										<th>총 일수</th>
                                        <th>종류</th>
										<th>처리 상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>조은진</td>
										<td>2022/10/17</td>
										<td>2022/10/20</td>
										<td>2022/10/30</td>
										<td>10</td>
                                        <td>연차</td>
										<td>승인 대기</td>	
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
<link rel="stylesheet" href="${root}/resources/css/attendance.css">
</html>