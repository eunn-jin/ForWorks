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
   
    .input_css{
        width: 80px;
        font-size: 20px;
        border: none;
    }

    /*모달 css*/
    .modal{
        position:absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        background-color: rgba(0,0,0,0.4);
    }

    .modal .show{
        display: block;
    }

    .modal_body{
        position: absolute;
        top: 50%;
        left: 50%;
        width: 400px;
        height: 600px;
        padding: 40px;
        text-align: left;
        background-color: rgb(255,255,255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34,36,38,0.15);

        transform: translateX(-50%) translateY(-50%);
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
				            
				            <!--<button onclick="changeDepart()">직원조회</button>-->
                            
				        </div>
				        <div id="check-btn">
				            <button class="btn-open-popup">수당종류 추가</button>
				        </div>
				        <div id="center">
                        
                            <div class="div-top">부서명</div>
                            <div class="div-top">직원명</div>
                            <div class="div-top">직급</div>
                            <div class="div-top">입사일</div>

                            
				        
				        
					        <c:forEach items="${EmpList}" var="el">
					        	
                                <div style="display: none;"><input type="hidden" id="no" value="1"></div>
                                <div>부서명임</div>
						        <div><a href="${root}/bonus/detail/1">홍길동</a></div>
						        <div>대리</div>
                                <div>2022-01-01</div>
					
					        </c:forEach>
					        
			
				        </div>
				    
					</div>

                    <!--수당 등록 버튼 클릭 시 모달창-->
                                            
                    <div class="modal">
                        <div class="modal_body">
                            <div><h1>수당 종류 등록</h1></div>
                            수당명
                            <input type="text" id="title" name="title"> <br>
                            <input type="button" value="등록하기" id="add-btn" onclick="addBenefit()">
              
                            <div><button class="modal_close">close</button></div>
                        </div>
                    </div>



                    <!--모달 js-->
                    <script>
                        const modal = document.querySelector('.modal');
                        const btnOpenPopup = document.querySelector('.btn-open-popup');

                        btnOpenPopup.addEventListener('click',()=>{
                            modal.style.display = 'block';
                        })
                        
                        const close = document.querySelector('.modal_close');
                        close.addEventListener('click',()=>{
                            modal.style.display = 'none';
                        })
                    </script>

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
	
	$.ajax({
		url : "/ForWorks/bonus/selectEmp",
		//dataType :'json',
		type : 'POST',
		data : {depart : depart},
		success : function(result){
            $('#center').empty();
            $('#center').append(
                '<div class="div-top">부서</div><div class="div-top">직원명</div><div class="div-top">직급</div><div class="div-top">입사일</div>'
            );
            console.log(result[0]);
            for(var i = 0 ; i < result.length ; i++){

                $('#center').append(
                    '<div class="div-top">'+depart+'</div><div class="div-top"><a href="${root}/bonus/detail/'+result[i].empNo+'">'+result[i].empName+'</a></div><div class="div-top">'+result[i].posName+'</div><div class="div-top">'+result[i].empJdate+'</div>');
            }
		},
        error:function(){
            alert("x");
        }
    })
        }
			


</script>


<!-- 수당 등록 ajax  -->
<script>

function addBenefit(){
	console.log('되니');
	const bonusTitle = document.querySelector('input[name=title]').value;
	$.ajax({
		url : "/ForWorks/bonus/addBenefit",
		type : 'POST',
		data : {title : bonusTitle},
		success : function(data){
			if(data == 1){
				alert("등록되었습니다.");
				modal.style.display = 'none';
			}else{
				alert("입력값을 확인해주세요");	
			}
		},
		error : function(){
			alert("ajax통신 실패");
		}
	});
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
