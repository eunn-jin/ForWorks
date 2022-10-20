<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<style>

    #wrap{
        width: 60vw;
        height: 60vh;
        font-size: 20px;
    }
 	#center{
        width: 60vw;
        height: 60vh;
        border: 1px solid black;/*확인용*/
        display: grid;
        grid-template-columns: 4fr 4fr 4fr 4fr;
        grid-template-rows: repeat(11,40px);
        text-align: center;
        background-color: white;
        overflow: scroll;
    }
    .div-top{
        font-size: larger;
        color: black;
        font-weight: bolder;
        border-bottom: 1px solid #7D6CFF;
    }
  
    #search{
        display: inline-block;
        
        height: 30px;
        font-size: 20px;
        color: #7D6CFF;
        font-weight: bolder;
    }
    #search>select{
        height: 25px;
    }
    #check-btn{
        position: relative;
        float: right;
        height: 30px;
    }
    #check-btn>button{
        cursor: pointer;
        height: 100%;
        font-size: large;
        background-color: white;
        border: none;
        color: #7D6CFF;
        font-weight: bolder;
    }
    #save{
        font-size: 20px;
        width: 80px;
    }
    #save-div{
        position: absolute;
        bottom: 0;
        right:45%;
    }
    .input_css{
        width: 80px;
        font-size: 20px;
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
				        <div id="search">
				            <select name="depart" id="depart" onchange="changeDepart()">
				            		<option value="">부서</option>
				            	<c:forEach items="${departList}" var="d">
					                <option value="${d}">${d}</option>
				            	</c:forEach>
				            </select>
				            <button onclick="empBenefit()">검색</button>
                            <span>개발팀</span>
				            <span>|</span>
                            <span>홍길동</span>
                            <span>|</span>
                            <span>생년월일 : </span><span>1990.01.01</span>
				        </div>
                        <form action="">
				        
				        <div id="center">
				        <div class="div-top">수당명</div>
				        <div class="div-top">수당금/(시간)</div>
				        <div class="div-top">해당 시간</div>
				        <div class="div-top">지급액</div>

                            
                            <c:forEach items="${benefitVo}" var="bv">
                                <div style="display: none;"><input type="hidden" name="no" value="${bv.no}"></div>
                                <div>${bv.cate}</div>
						        <div><input type="text" id="money" name="money" value="${bv.amount}" class="input_css" placeholder="0">원</div>
						        <div><input type="number" id="hour" value="" class="input_css" placeholder="0">시간</div>
						        <div id="sum"></div>
					        </c:forEach>
					        
					        
					        <div id="save-div">
                                <input type="submit" value="저장">
					        </div>
                        </form>
				        
				        </div>
				    
					</div>


               </section>
           </div>
           
       </div>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<!-- 부서에 해당하는 직원 조회 -->
<script>

function changeDepart(){
	var x = document.getElementById("depart");
	var depart = x.options[x.selectedIndex].text;
	
	$('#emp').empty();
	
	$.ajax({
		url : "/ForWorks/bonus/selectEmp",
		dataType :'json',
		type : 'POST',
		data : {depart : depart},
		success : function(data){
		$.each(data, function(index,value){
			var option = $("<option>"+value+"</option>");
			$('#emp').append(option);
			
		})
			
			
			
		}
	})
	
}; 

</script>

<!-- 직원의 수당정보조회 -->
<script>
function empBenefit(){
	
	var d = document.getElementById("depart");
	var dt = d.options[d.selectedIndex].text;
	var e = document.getElementById("emp");
	var et = e.options[e.selectedIndex].text;
	
	$.ajax({
		url : "/ForWorks/bonus/empBenefit",
		typd : 'POST',
		data : {
				depart : dt,
				emp : et
				},
		success : function(){
			alert('통신성공');
		}
				
	})
}

</script>


</body>
<script>
	
	$().ready(function() {
		console.log("test:");
		$('#ex1').addClass("active");
	});
	
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</html>