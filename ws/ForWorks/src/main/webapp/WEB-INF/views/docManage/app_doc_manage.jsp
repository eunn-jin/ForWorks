<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        grid-template-columns: 2fr 3fr 4fr 3fr 4fr 2fr;
        grid-template-rows: repeat(11,50px);
        text-align: center;
        background-color: white;
    }
    .div-top{
        font-size: larger;
        color: black;
        font-weight: bolder;
        border-bottom: 1px solid #7D6CFF;
        padding-top: 10px;
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
    #check-cate{
        display: inline-block;
        height: 30px;
        font-size: large;
        color: black;
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
        border: none;
        /*background-color: white;
        border: none;
        border-radius: 30px;
        border: 1px solid #7D6CFF;*/
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
                           <h3>문서관리</h3>
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
				        <div id="check-cate">
				           <a href="">일반문서</a>
				           <a href="">결재문서</a>
				        </div>
				        <div id="check-btn">
				            <button onclick="location.href='${root}/docmanage/write'">+ 일반문서작성</button>
				        </div>
				        <div id="center">
				            <div class="div-top">글번호</div>
				            <div class="div-top">보존마감일</div>
				        <div class="div-top">제목</div>
				        <div class="div-top">공개범위</div>
				        <div class="div-top">등록일</div>
                        <div class="div-top">게시상태</div>
				        
                        <c:forEach items="${voList}" var="x">
                            <div>${x.docNo}</div>
                            <div>2022.12.31</div>
                            <div><a href="${root}/docmanage/manDetail/${x.docNo}">${x.title}</a></div>
                            <div>전체공개</div>
                            <div>${x.enrollDate}</div>
                            <div>${x.contStatus}</div>
                        </c:forEach>
				      
				        
				        </div>
				        
				        <div id="page-area">
				            <c:if test="${pv.startPage ne 1 }">
								<a href="${root}/docManage/doc_manage/${pv.startPage - 1}" class="btn btn-primary btn-sm">이전</a>	
							</c:if>
							
							<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
								<a href="${root}/docmanage/manage/${i}" class="btn btn-primary btn-sm">${i}</a>
							</c:forEach>
							
							<c:if test="${pv.endPage ne pv.maxPage }">
								<a href="${root}/docmanage/manage/${pv.endPage + 1}" class="btn btn-primary btn-sm">다음</a>	
							</c:if>
				        </div>
				
				        <div id="search-area">
				            
				            <form action="">
				                <select name="" id="">
				                    <option value="">제목</option>
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
		$('#doc-manage').addClass("active");
		$('#doc-part').css("display", "block");
	});
	
</script>
</html>