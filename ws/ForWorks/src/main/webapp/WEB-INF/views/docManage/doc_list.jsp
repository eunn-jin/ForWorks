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
        grid-template-columns: 3fr 4fr 4fr 4fr 4fr;
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
    .title{
        text-align: left;
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
                           <h3>일반문서</h3>
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
				           <a href="${root}/docmanage/list/1">일반문서</a>
				           <a href="${root}/appmanage/list/1">결재문서</a>
				        </div>
				        <div id="check-btn">
				            <button onclick="location.href='${root}/docmanage/write'">+ 일반문서작성</button>
				        </div>
				        <div id="center">
				            <div class="div-top">NO</div>
				            <div class="div-top">보존마감일</div>
				        <div class="div-top">제목</div>
				        <div class="div-top">공개범위</div>
				        <div class="div-top">등록일</div>
				        
                        <c:forEach items="${result}" var="x">
                            <div class="set">${x.docNo}</div>
                            <div class="set">${x.contEndDate}</div>
                            <div class="title set"><a href="${root}/docmanage/detail/${x.docNo}">${x.title}</a></div>
                            <div class="set">
                            	<c:choose>
                            		<c:when test="${x.range eq 'OPEN,1경영지원부,2인사부,3총무부,4기획부,5재무부,6사업부,7영업부,8IT부,'}">전체공개</c:when>
                            		<c:otherwise>해당부서</c:otherwise>
                            	</c:choose>
                            </div>
                            <div class="set">${x.enrollDate}</div>
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
				            
				            <form action="" >
				                <select name="" id="">
				                    <option value="">제목</option>
				                </select>
				                <input type="text" name="s_content" id="s_content">
                                <input type="button" onclick="search()" value="검색">
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
    function search(){
        var sContent = document.getElementById("s_content").value;

        $.ajax({
            url : "/ForWorks/docmanage/search",
            type : "POST",
            data :{sContent : sContent} ,
            success : function(data){
                alert(data[0].title);
                $("div").remove(".set");
                for(var i = 0 ; i < data.length; i++){
                  $(".div-top").append('<div class="set">'+data[i].docNo+'</div><div></div><div></div><div></div><div></div>');
                }
            },
            error : function(){
                alert("검색실패");
            }
        })
        

    }
</script>

<script>
	
	$().ready(function() {
		$('#doc-list').addClass("active");
		$('#doc-part').css("display", "block");
	});
	
</script>
</html>
