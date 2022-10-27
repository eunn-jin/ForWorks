<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<style>
    #wrap{
        background-color: white;
        width: 60vw;
        height: 60vh;
        font-size: 20px;
    }
    table{
        width: 100%;
        border: 1px solid black;
        text-align: left;
    }
    #title{
        text-align: center;
        font-size: larger;
        font-weight: bolder;
    }
    .back-color{
        background-color: #EEF1FF;
		display: none;
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
                       <div class="col-12 col-md-6 order-md-1 order-last">
                           <h3>Layout Default</h3>
                           <p class="text-subtitle text-muted">The default layout </p>
                       </div>
                       <div class="col-12 col-md-6 order-md-2 order-first">
                           <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                               <ol class="breadcrumb">
                                   <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                   <li class="breadcrumb-item active" aria-current="page">Layout Default</li>
                               </ol>
                           </nav>
                       </div>
                   </div>
               </div>
               <section class="section">
                   <div id="wrap">
				        <div id="title">급여대장 등록</div>
				        <div>
							<select name="year" id="year"></select>
							<select name="month" id="month">
							
							</select>
						</div>
		           	 	<div id="center">
							<form action="">

								<table>
									<tr>
										<td>부서명</td>
										<td>
											<select name="dept" id="dept">
												<option value="">부서선택</option>
												<c:forEach items="${departList}" var="d">
													<option value="${d}">${d}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td>사원명</td>
										<td>
											<select name="emp" id="emp">
												<option value="">직원선택</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>정산기간</td>
										<td><input name="start-month" id="start-month"> ~ <input name="end-month" id="end-month"></td>
									</tr>
									<tr>
										<td>지급날짜</td>
										<td><input type="date" name="pay-date"></td>
									</tr>
									<tr>
										<td>급여구분</td>
										<td>
											<select name="cate" id="cate">
												<option value="1">월급</option>
												<option value="2">상여</option>
												<option value="3">월급+상여</option>
											</select>
										</td>
									</tr>
								</table>
							</form>
							<div class="back-color">
									<div class="back-color" id="salary-zone">월급</div>
									<ul>
										<span>기본급</span><span>2,000,000원(emp불러오기)</span>
										<br>
										<span>수당(수당리스트불러오기 empno로조회)</span>
										<br>
											초과수당 <span>10,000원(수당액 * 근무시간)</span>
									</ul>
							</div>
							<div class="back-color">
								<div class="back-color" id="bonus-zone">상여</div>
								<ul>
									<span>22년 하반기 상여-1</span>
									<br>
									<span>1,000,000원</span>
								</ul>
							</div>
							<div style="float:right;">
								총급여 : 3,010,000원
							</div>
							<div><input type="submit" value="등록"></div>
						</div>
		    		</div>
               </section>
           </div>
           
       </div>

</div>

<!--부서별 직원조회-->
<script>
	$("select[name=dept]").change(function(){
        var depart = $(this).val();
        console.log(depart);
        
        $.ajax({
			url : "/ForWorks/salary/selectEmp",
			type : "POST",
			data : {depart : depart},
			success : function(result){
				console.log(result[0]);
				$('#emp').empty;
				for(var i = 0 ; i <result.length ; i++){
                        $('#emp').append(
                            '<option value='+result[i].empNo+'>'+result[i].empName+'</option>'
                        )
                }
            },
            error:function(){
                    alert("통신실패");
            }

        })
    })
</script>
<!--급여구분 선택 시 div-->
<script>
	$("#cate").change(function(){
		var cate = $(this).val();
		var salaryzone = document.querySelector(".back-color");
		console.log(cate);
		if(cate == 1){
			salaryzone.style.display = 'block';
		}
	})
</script>
<!--연도 selectbox-->
<script>
    $(document).ready(function(){
        var now = new Date();
        var com_year = now.getFullYear();
        console.log("com_year" + com_year);
        $("#year").append("<option value=''>연도</option>");
        for(var i = (com_year); i >= 2000 ; i--){
            $("#year").append("<option value='"+i+"'>"+i+"년"+"</option>");
        }
		for(var j = 1; j <=12; j++){
			$("#month").append("<option value='"+j+"'>"+j+"월"+"</option>");
		}
    })
</script>
<!--시작일, 종료일-->
<script>
	$(function(){
		$('#start-month , #end-month').datepicker({
			dateFormat : "yy-mm-dd",
			maxDate : 0,
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			showMonthAfterYear: true,
			yearSuffix: '년'
		}
		);
	})
</script>
<!--제이쿼리 ui css-->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!--제이쿼리 style css
<link rel="stylesheet" href="/resources/demos/style.css">-->
<!--제이쿼리 js-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!--제이쿼리 ui js-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script>
	
	$().ready(function() {
		console.log("test:");
		$('#ex1').addClass("active");
	});
	
</script>
</html>
