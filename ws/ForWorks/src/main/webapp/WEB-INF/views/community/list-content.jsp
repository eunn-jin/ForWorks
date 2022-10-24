<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
tr:hover{
    cursor: pointer;
    background-color: rgba(128, 128, 128, 0.425);
}
tr>th:hover{
    cursor: default; 
}
.b{
    color:black;
}
</style>
<link rel="stylesheet" href="${root}/resources/css/sjy.css"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- 검색박스 -->


<div class="container" style="margin: 3% 5%;">
	<div class="row">
		
		<div class="col">
			<div class="csearch" >
			
		
                    <!-- <input type="search" class="form-control ds-input" id="" placeholder="Search docs..." style="width: auto; display: inline; " > -->
					<div class="input-group w-70" >
						<select class="form-select" aria-label="Default select example" >
							<option selected>선택</option>
							<option value="">제목</option>
							<option value="">작성자</option>
						</select>
						<input type="text" class="form-control" placeholder="Input group example" aria-label="Input group example" aria-describedby="basic-addon1" >
						<span class="input-group-text" id="basic-addon1">
							<button class="mybtn">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
							</svg>
							</button>
						</span>
					</div>
            
			</div>
			
			<ul class="nav nav-tabs" >
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#all">전체</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#ing">_ _부서</a></li>

			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="all">
					<!--  투표 현황(전체) -->
					<div id="notice" style="text-align: left;width: 100%;">
						<div id="list" style="overflow: auto; width: 100%;">

							<table class="table" id="table-main">
								<thead class="table-light">
									<tr id="center">
										<th scope="col">#</th>
										<th scope="col" colspan="5">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">조회수</th>
										<th scope="col">공개범위</th>
										<th scope="col">작성일</th>
									</tr>
								</thead>

								<%int i=0; %>
								<c:forEach begin="1" step="1" end="10">
									<tbody>
										<tr id="center">

											<th scope="row">1</th>
											<td colspan="5">안녕하세요 신입입니다.ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>

											<td>ㅁㅁㅁ</td>
											<td>10</td>
											<td>전체</td>
											<td>22-10-05</td>
										</tr>
									</tbody>
								</c:forEach>
								<td colspan="10"style="border: none; cursor: default; background: white;">
									<ul class="pagination justify-content-center">
										<li class="page-item disabled"><a class="page-link"><</a>
										</li>
										<li class="page-item active" aria-current="page"><a
											class="page-link b" href="#">1</a></li>
										<li class="page-item"><a class="page-link b" href="#">2</a></li>
										<li class="page-item"><a class="page-link b" href="#">3</a></li>
										<li class="page-item"><a class="page-link b" href="#">></a>
										</li>
									</ul>
								</td>

							</table>
						</div>
						<!-- 생성권한이 있는 사람만 -->
						<div style="text-align: right;">
							<a href="/forworks/board/write"><button class="myBtn"
									style="margin-right: 5%;">게시글 작성</button></a>
						</div>

					</div>
				</div>
				<div class="tab-pane fade" id="ing">
					<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aut culpa recusandae, magnam dicta laboriosam architecto fugit excepturi illo quo laudantium deserunt exercitationem cumque blanditiis sint, obcaecati libero. Delectus, vero sed?</p>
				</div>

			</div>
		</div>
	</div>
</div>




<script>
	$(function() {
		$('#table-main>tbody>tr').click(function() {
			//행 클릭 되었을때, 동작할 내용

			//글번호 가져오기
			const num = $(this).children().eq(0).text();

			//로그인한 회원의 정보중 이름을 가져와서 현재 선택한글의 작성자와 같은지 판별

			//해당 번호로 요청 보내기
			
			//작성자인경우
			location.href = '${root}/board/detail?num=' + num;

			//아닌경우
			//location.href = '${root}/vote/detailUser?num=' + num;
		});
	})
</script>
