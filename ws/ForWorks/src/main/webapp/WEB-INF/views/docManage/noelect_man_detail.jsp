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
                    <form action="" method="post">

                    
                    <table>
                        <tr>
                            <td> 
                                <label><input type="checkbox" name="contStatus" id="Y" value="Y"  <c:if test="${vo.contStatus eq 'Y'}">checked</c:if>>게시중</label>
                                <label><input type="checkbox" name="contStatus" id="N" value="N" <c:if test="${vo.contStatus eq 'N'}">checked</c:if>>비공개</label>
                            </td>
                        </tr>
                        <tr>
                            <td>${vo.adocName}</td>
                        </tr>
                        <tr>
                            <td>보존기간</td>
                            <td><input type="date" name="contEnrollDate"> ~ <input type="date" name="contEndDate"></td>
                        </tr>
                        <th>공개범위</th>
                        <td>
                              <label><input type="checkbox" name="range_" id="all" value="OPEN">전체공개</label>
                            <c:forEach items="${dept}" var="d">
                              <label> <input type="checkbox" name="range_" value="${d.deptNo}${d.deptName}">${d.deptName}</label>
                            </c:forEach>               
                        </td>
                        <tr>
                            <td colspan="3"><div>${vo.adocContent}</div></td>
                        </tr>
                        <tr>
                            <td>
                                <img src="${root}/resources/doc-file/upload/${vo.noelecChangeName}"/>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" value="게시상태수정">
                    </form>

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
