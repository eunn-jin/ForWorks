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
				        <div>2022 10월</div>
		            <div id="center">
		                <table>
		                    <tr>
		                        <td>사원명</td>
		                        <td><input type="search"></td>
		                    </tr>
		                    <tr>
		                        <td>정산기간</td>
		                        <td><input type="date"> ~ <input type="date"></td>
		                    </tr>
		                    <tr>
		                        <td>급여구분</td>
		                        <td>
		                            <select name="" id="">
		                            <option value="">월급</option>
		                            <option value="">상여</option>
		                            <option value="">월급+상여</option>
		                            </select>
		                        </td>
		                    </tr>
		                </table>
		                <div class="back-color">
		                    <div class="back-color">월급</div>
		                        <ul>
		                            <span>기본급</span><span>2,000,000원</span>
		                            <br>
		                            <span>수당</span>
		                            <br>
		                                초과수당 <span>10,000원</span>
		                        </ul>
		                </div>
		                <div class="back-color">
		                    <div class="back-color">상여</div>
		                    <ul>
		                        <span>22년 하반기 상여-1</span>
		                        <br>
		                        <span>1,000,000원</span>
		                    </ul>
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
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script>
	
	$().ready(function() {
		console.log("test:");
		$('#ex1').addClass("active");
	});
	
</script>
</html>
