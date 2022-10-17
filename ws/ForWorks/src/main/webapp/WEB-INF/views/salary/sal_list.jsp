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
    }
    #center{
        width: 60vw;
        height: 60vh;
        border: 1px solid black;/*확인용*/
        display: grid;
        grid-template-columns: 2fr 4fr 4fr 4fr 4fr 6fr;
        grid-template-rows: repeat(11,30px);
        text-align: center;
        background-color: white;
    }
    .div-top{
        font-size: larger;
        color: black;
        font-weight: bolder;
        border-bottom: 1px solid #7D6CFF;
    }
    #page-area{
        width: 30%;
        margin: 0 auto;
        display: flex;
        justify-content: space-around;
    }
    #search-area{
        margin: 0 auto;
        display: flex;
        justify-content: space-around;
    }
    #check-date{
        display: inline-block;
        background-color:white;
        height: 30px;
        font-size: large;
        color: #7D6CFF;
        font-weight: bolder;
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
				        <div id="check-date">
				            <form action="">
				                급여대장 목록 
				                <select name="year" id="year" title="년도">
				                    <option value="">2022</option>
				                </select> 
				                <select name="month" id="month" title="월">
				                    <option value="1">01</option><option value="2">02</option><option value="3">03</option><option value="4">04</option><option value="5">05</option><option value="6">06</option><option value="7">07</option><option value="8">08</option><option value="9">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
				                </select>
				            </form>
				        </div>
				        <div id="check-btn">
				            <button>+ 체크 명세서공개</button>
				        </div>
				        <div id="center">
				            <div class="div-top">체크</div>
				            <div class="div-top">급여구분</div>
				        <div class="div-top">부서명</div>
				        <div class="div-top">사원명</div>
				        <div class="div-top">공개여부</div>
				        <div class="div-top">등록일</div>
				        
				        <div><input type="checkbox" name="" id=""></div>
				        <div>월급</div>
				        <div>인사</div>
				        <div>홍길동</div>
				        <div>공개</div>
				        <div>2022.10.22</div>
				        <div><input type="checkbox" name="" id=""></div>
				        <div>월급</div>
				        <div>인사</div>
				        <div>홍길동</div>
				        <div>공개</div>
				        <div>2022.10.22</div>
				        <div><input type="checkbox" name="" id=""></div>
				        <div>월급</div>
				        <div>인사</div>
				        <div>홍길동</div>
				        <div>공개</div>
				        <div>2022.10.22</div>
				        
				        </div>
				        
				        <div id="page-area">
				            <a href=""><</a>
				            <a href="">1</a>
				            <a href="">2</a>
				            <a href="">3</a>
				            <a href="">4</a>
				            <a href="">5</a>
				            <a href="">></a>
				        </div>
				
				        <div id="search-area">
				            
				            <form action="">
				                <select name="" id="">
				                    <option value="">사원명</option>
				                </select>
				                <input type="text">
				                <input type="submit" value="검색">
				            </form>
				
				        </div>
					</div>

               </section>
           </div>
           
       </div>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script>
	
	$().ready(function() {
		console.log("test:");
		$('#ex1').addClass("active");
	});
	
</script>
</html>
