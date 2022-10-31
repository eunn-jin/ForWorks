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
	.back-color2{
        background-color: #EEF1FF;
		display: none;
	
    }
	.btn-css{
		background-color: blueviolet;
		border-color: #25396f;
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
                           <h3>급여대장 등록</h3>
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
						<form action="" method="post">
				        <div>
							<input type="month" name="salMonth">
						</div>
		           	 	<div id="center">

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
											<select name="empNo" id="emp">
												<option value="">직원선택</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>정산기간</td>
										<td><input name="startMonth" id="start-month"> ~ <input name="endMonth" id="end-month"></td>
									</tr>
									<tr>
										<td>지급날짜</td>
										<td><input type="date" name="payDate"></td>
									</tr>
									<tr>
										<td>급여구분</td>
										<td>
											<select name="salCate" id="cate">
												<option value="">선택</option>
												<option value="1">월급</option>
												<option value="2">상여</option>
												<option value="3">월급+상여</option>
											</select>
										</td>
									</tr>
								</table>
								<div><input type="submit" value="등록" class="btn-css"></div>
							</form>
							<div id="zone">
								<div class="back-color">
									<div id="s-zone">월급</div>
									<table id="s-table">
										
									</table>
								</div>
								<div class="back-color2">
									<div id="bonus-zone">상여</div>
									<table id="b-table">
										
									</table>
								</div>
							</div>	
							<div style="float:right;">
								총급여 : 3,010,000원
							</div>
							
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
		var szone = document.querySelector(".back-color");
		var bzone = document.querySelector(".back-color2");

		var x = document.getElementById("emp");
		var empNo = x.options[x.selectedIndex].value; 

		var startMonth = document.getElementById("start-month").value;
		var endMonth = document.getElementById("end-month").value;

		if(cate == 1){
			bzone.style.display = 'none';
			szone.style.display = 'block';

			$.ajax({
				url : "/ForWorks/salary/empSal",
				type : "POST",
				data :{ 
					empNo : empNo,
				},
				success : function(data){
					alert("되나");
					$('#s-table').empty;
					console.log(data);
					$('#s-table').append('<tr><td>기본급</td><td>'+data[0].empMoney+'</td></tr>')
					$('#s-table').append('<tr><td>수당명</td><td>수당금</td></tr>')
					for(var i = 0; i < data.length;i++){
						$('#s-table').append('<tr><td>'+data[i].cate+'</td><td>'+data[i].amount+'</td></tr>');
					}
				},
				error : function(){
					alert("실패");
				}
			})
		}



		if(cate == 2){
			szone.style.display = 'none';
			bzone.style.display = 'block';

			$.ajax({
				url : "/ForWorks/salary/empBonus",
				type : "POST",
				data :{ 
					empNo : empNo,
					startMonth : startMonth,
					endMonth : endMonth 
				},
				success : function(data){
					alert("되나");
					console.log(data[0]);
					/*$('#b-table').append('<tr><td>상여제목</td><td>상여금</td></tr>')*/
					for(var i = 0; i < data.length;i++){
						$('#b-table').append('<tr><td>'+data[i].title+'</td><td>'+data[i].payment+'</td></tr>');
					}
				},
				error : function(){
					alert("실패");
				}
			})
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
