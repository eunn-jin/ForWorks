<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<link rel="stylesheet" href="${root}/resources/css/sjy.css">
<html>
<head>
	<title>설문-상세보기(사원)</title>
</head>
<body style="display: inline;">

<div id="app">

	<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>

	<div id="main">
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        
            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>투표/설문조사</h3>
                            <p class="text-subtitle text-muted">투표 상세보기</p>
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
                <section class="section" >
                    <div class="card" >
                        
                        <%@include file="/WEB-INF/views/QA/detailUser-content.jsp" %>
                    </div>
                </div>
                            <div style="text-align: right;"> 
                                
                                
                                
                                <c:if test="${check == 1}">
                                    <button class="myBtn">작성</button>
                                    <c:if test="${x != 0}">
                                    <button class="myBtn" id="update-aw">수정</button>
                                    </c:if>
                                </c:if>
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
<script>
    //답변 작성자 번호 가져오기


</script>

<!-- 수정 -->
<script>
	
    const awBtn = document.querySelector('#update-aw');
    
    awBtn.addEventListener('click' ,  function(){
        //답변내용 가져오기 qaawContent
        var qaawContent = document.querySelectorAll("input[name='qaawContent']");
        console.log("qq::"+qaawContent);
        var xxx = [];
        for(var i=0;i<${fn:length(chaw)};i++){
            console.log(qaawContent[i].value);
            xxx.push(qaawContent[i].value);

        }
        console.log(xxx);
        var pno = +${qavo.qaNo};
        console.log("번호"+pno);
        $.ajax({
            url : "${root}/QA/updateAw/"+pno,
            type : "POST",
            data : {
                    "qaawContent" : xxx,
                    
            },
            success : function(result){
                if (result =='ok') {
                    alert("수정완료!");

                }
                else{
                    alert("수정 실패..");
                }
            },
            error : function(){
                alert("통신 에러..");	
            },
        });
    });
</script>
</html>
