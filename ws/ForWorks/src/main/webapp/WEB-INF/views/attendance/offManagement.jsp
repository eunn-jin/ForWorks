<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>휴가관리</title>
</head>
<!-- css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
 
<!-- js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

<style>
	
	.multi-card {
		display: flex;
	    flex-wrap: wrap;
		justify-content: space-around;
    }

	.align-center {
    	text-align: center;
	}

	.flex-col {
		display: flex;
		flex-direction: column;
		justify-content: space-around;
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

    .first-card {
        width: 80%;
        margin: auto;
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
						<h3>휴가 사용 현황</h3>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="card first-card">
                    <div class="card-body">
                        <div class="flex-row">
                            <div class="align-center mt-3 mb-2">
                                <div>15</div>
                                <div>총 연차</div>
                            </div>
                            <div class="align-center mt-3 mb-2">
                                <div>12</div>
                                <div>사용 연차</div>
                            </div>
                            <div class="align-center mt-3 mb-2">
                                <div>3</div>
                                <div>잔여 연차</div>
                            </div>
                        </div>
                    </div>
                </div>

				<div class="card">
					<div class="card-body">
						<div class="flex-row-side">
							<div class>
								<input type="year">
								<button class="btn btn-primary btn-sm">검색</button>
							</div>
							<div>
								<button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#offForm">휴가 신청</button>
							</div>
						</div>
						<div class="table-responsive mt-5">
							<table class="table table-bordered mb-0">
								<thead>
									<tr>
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

			<div class="modal fade text-left" id="offForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true" data-bs-backdrop="false">
				<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel33">휴가 신청서 </h4>
						</div>
						<form action="#">
							<div class="modal-body">
								<div class="form-group">
									<label>사원 이름: </label>
									<span>조은진</span>
								</div>
								<div class="form-group">
									<label>기간: </label>
									<input type="text" id="demo" name="demo" value="" />
								</div>
								<div class="form-group">
									<label>휴가 종류: </label>
									<label><input type="radio" name="type" value="">연차</label>
									<label><input type="radio" name="type" value="">조퇴</label>
									<label><input type="radio" name="type" value="">휴가</label>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-light-secondary"
									data-bs-dismiss="modal">
									<i class="bx bx-x d-block d-sm-none"></i>
									<span class="d-none d-sm-block">취소하기</span>
								</button>
								<button type="button" class="btn btn-primary ml-1"
									data-bs-dismiss="modal">
									<i class="bx bx-check d-block d-sm-none"></i>
									<span class="d-none d-sm-block">신청하기</span>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
		
    </div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</body>
<script>
	
	$().ready(function() {
		$('#att-off').addClass("active");
		$('#att-part').css("display", "block");

		$('#demo').daterangepicker({
			"locale": {
				"format": "YYYY-MM-DD",
				"separator": " ~ ",
				"applyLabel": "확인",
				"cancelLabel": "취소",
				"fromLabel": "From",
				"toLabel": "To",
				"customRangeLabel": "Custom",
				"weekLabel": "W",
				"daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
				"monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
				"firstDay": 1
			},
			"startDate": "2020-10-21",
			"endDate": "2020-10-23",
			"drops": "down"
		}, function (start, end, label) {
			console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
		});
	});
	
</script>

</html>