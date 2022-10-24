<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					href="#my">_ _부서</a></li>

			</ul>
			<div class="tab-content">
				<div class="tab-pane fade show active" id="all">
					
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

								
								<c:forEach items="${cmuList }" var="cmu">
									<tbody id="tbd">
										<tr id="center">
											
											<th scope="row">${cmu.cmuNo}</th>
											<td colspan="5">${cmu.cmuTitle}</td>

											<td>${cmu.empNo}</td>
											<td>${cmu.cmuCnt}</td>
											<td>${cmu.cmuRead}</td>
											<td>${cmu.cmuModifiyDate}</td>
										</tr>
									</tbody>
								</c:forEach>
								<td  colspan="10" style="border:none; cursor: default; background: white;">
            
									<ul class="pagination justify-content-center">
										
										<c:if test="${pv.startPage ne 1 }">	
											<li><a href="${root}/community/list/1" class="page-link b disabled">처음</a></li>
											<li class="page-item"><a href="${root}/community/list/${pv.startPage -1 }" class="page-link">이전</a></li>
										</c:if>
					
										
					
										<c:forEach begin="${pv.startPage }" end="${pv.endPage }" var="i">
											<li class="page-item " aria-current="page">
												<a class="page-link b" href="${root}/community/list/${i}">${i}</a>
											</li>
										</c:forEach>
					
										<c:if test="${pv.endPage ne pv.maxPage }">
											<li><a class="page-link b" href="${root}/community/list/${pv.endPage +1 }">다음</a></li>
											<li><a href="${root}/community/list/${pv.maxPage }" class="page-link b">끝</a></li>
										</c:if>
									</ul>
								
								</td>

							</table>
						</div>
						<!-- 생성권한이 있는 사람만 -->
						<div style="text-align: right;">
							<a href="${root}/community/write"><button class="myBtn"
									style="margin-right: 5%;">게시글 작성</button></a>
						</div>

					</div>
				</div>


				<!-- my탭 클릭시 보여지는 화면 -->
				<div class="tab-pane fade" id="my">
					
					
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

								<!-- 조건 :: 로그인한 회원의 부서정보값이랑 같은 정보만 가져오기 -->
								<c:forEach items="${cmudpList }" var="cmdp">
									<c:set var="ltn" value="${fn:length(cmudpList)}"/>
									<!-- <div>${ltn}</div> -->
									<c:set var="k" value="${k+1}"/>
									<tbody id="tbd2">
										<tr id="center2">
											<input type="hidden"  value="${cmdp.cmuNo}">
											<th scope="row">${ltn-k+1}</th>
											<td colspan="5">${cmdp.cmuTitle}</td>

											<td>${cmdp.empNo}</td>
											<td>${cmdp.cmuCnt}</td>
											<td>${cmdp.cmuRead}</td>
											<td>${cmdp.cmuModifiyDate}</td>
										</tr>
									</tbody>
									
								</c:forEach>
								<td  colspan="10" style="border:none; cursor: default; background: white;">
            
									<ul class="pagination justify-content-center">
										
										<c:if test="${pvdp.startPage ne 1 }">	
											<li><a href="${root}/community/list/1" class="page-link b disabled">처음</a></li>
											<li class="page-item"><a href="${root}/community/list/${pvdp.startPage -1 }" class="page-link">이전</a></li>
										</c:if>
					
										
					
										<c:forEach begin="${pvdp.startPage }" end="${pvdp.endPage }" var="j">
											<li class="page-item " aria-current="page">
												<a class="page-link b" href="${root}/community/list/${j}">${j}</a>
											</li>
										</c:forEach>
					
										<c:if test="${pvdp.endPage ne pvdp.maxPage }">
											<li><a class="page-link b" href="${root}/community/list/${pvdp.endPage +1 }">다음</a></li>
											<li><a href="${root}/community/list/${pvdp.maxPage }" class="page-link b">끝</a></li>
										</c:if>
									</ul>
								
								</td>

							</table>
						</div>
						<!-- 생성권한이 있는 사람만 -->
						<div style="text-align: right;">
							<a href="${root}/community/write"><button class="myBtn"
									style="margin-right: 5%;">게시글 작성</button></a>
						</div>							

				</div>

			</div>
		</div>
	</div>
</div>




<script>
	$(function() {
		$('#table-main>tbody>#center').click(function(){
			//행 클릭 되었을때, 동작할 내용

			//글번호 가져오기
			const num = $(this).children().eq(0).text();

			//로그인한 회원의 정보중 이름을 가져와서 현재 선택한글의 작성자와 같은지 판별

			//해당 번호로 요청 보내기
			
			//작성자인경우
			location.href = '${root}/community/detail/' + num;

			//아닌경우
			//location.href = '${root}/vote/detailUser?num=' + num;
		});
	})
</script>

<script>
	
	$(function() {
		$('#table-main>tbody>#center2').click(function(){
			const num = $(this).children().eq(0).val();
			// console.log(":::"+num);
			location.href = '${root}/community/detail/' + num;
		});
	})
</script>