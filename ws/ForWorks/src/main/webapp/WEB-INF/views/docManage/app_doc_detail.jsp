<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<title>Home</title>
</head>
<style>
 	body{
        background-color: #EEF1FF;
    }
    #wrap{
        background-color: white;
        width: 60vw;
        height: 60vh;
        font-size: 20px;
    }
    
    .center-top{
        font-size: small;
    }
    #center{
        display: grid;
        grid-template-columns: 4fr 8fr;
        grid-template-rows: 40px 40px 40px 50px 70px;
    }
    .center-top{
        display: block;
        box-sizing: border-box;
       
    }
    #back-btn{
        text-align: center;
        margin-top: 50px;
    }
    table>tr{
        border-bottom: 1px solid gray;
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
                        
				            <table>
                                <tr>
                                    <td>${vo[0].adocName}</td>
                                </tr>
                                <tr>
                                    <td>보존기간</td>
                                    <td>${vo[0].contEnrollDate} ~ ${vo[0].contEndDate}</td>
                                </tr>
                                <tr>
                                    <th>기안날짜</th>
                                    <td>${vo[0].draftDate}</td>
                                    <th>기안자</th>
                                    <td>${vo[0].empName}</td>
                                    <th>결재인</th>
                                    <td>${vo[0].approveMember}</td>
                                </tr>
                                <tr>
                                    <td>첨부파일</td>
                                    <!--<td>
	                                    <c:if test="${fv ne null}">       	
	                                    		<a download href="${root}/resources/doc-file/upload/${fv.uploadName}">${fv.originName}</a>
	                                    </c:if>
                                    </td>-->
                                </tr>
                                <tr>
                                    <td colspan="3"><div>${vo[0].adocContent}</div></td>
                                </tr>
                                 <!--<c:if test="${fv ne null}">       	
                                    <c:if test="${fv.ext eq '.jpg' || fv.ext eq '.png' }">
                                   		<img src="${root}/resources/doc-file/upload/${fv.uploadName}"/>
                                    </c:if>
                                </c:if>-->
                             
                            </table>
				            
				            <div id="back-btn"><button  onclick="window.history.back()">목록</button></div>
				                
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
