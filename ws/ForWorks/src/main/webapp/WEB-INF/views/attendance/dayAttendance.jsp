<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>일일근태</title>
</head>
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
                   <div class="card">
                       <div class="card-header">
                           <h4 class="card-title">Default Layout</h4>
                       </div>
                       <div class="card-body">
                           예시 참고..
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