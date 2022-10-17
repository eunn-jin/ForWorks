<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>휴가관리</title>
</head>

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
								<button class="btn btn-outline-primary btn-sm">휴가 신청</button>
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
		</div>
		
    </div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</body>
<script>
	
	$().ready(function() {
		$('#att-off').addClass("active");
		$('#att-part').css("display", "block");
	});
	
</script>

</html>