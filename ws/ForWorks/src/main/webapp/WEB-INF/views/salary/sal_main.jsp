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
        border: 5px solid black;
        display: grid;
        grid-template-columns: 230px 230px;
        grid-template-rows: 150px 150px;
        justify-content: center;
        align-content: center;
        gap: 20px;
        background-color: white;
    }
    #wrap>div{
        box-sizing: border-box;
        display: inline-block;
        border-radius: 10%;
        text-align: center;
        font-size: 30px;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #EEF1FF;
        cursor: pointer;
        color : black;
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
				        <div onclick="location.href='${root}/salary/write'">급여대장 <br> 등록</div>
				        
				        <div onclick="location.href='${root}/salary/list'">급여대장 <br> 목록</div>
				        
				        <div onclick="location.href='${root}/bonus/list'">상여관리</div>
				        
				        <div onclick="location.href='${root}/bonus/benefit'">수당관리</div>
				        
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
