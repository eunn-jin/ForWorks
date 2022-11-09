<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<link rel="stylesheet" href="${root}/resources/css/sjy.css">
<style>
    .cic{
        
        height: 60vh;
        border-left: 1px dashed rgba(121, 121, 121, 0.555);
        
    }
</style>
<div id="container">
    <form action="" method="post" onsubmit="return check()" name="vote">
    <div class="dcontent" style="float: left; ">
        <div class="mglt" style="margin-top: 30px;">
            
            <h3><label for=""></label>&nbsp;<label for="">${vtvo.vtTitle}</label></h3>
            <!-- <label class="text-subtitle text-muted">투표자</label> -->
            <p class="text-subtitle text-muted" style="font-weight: 900;">기간:${vtvo.vtCreate}~${vtvo.vtEnd}</p>
            
            
            <div class="md-3"> 
                <label for="title" class="form-label">내용</label>
                <div>${vtvo.vtContent}</div>
            </div>
            <br>
            <c:forEach items="${vtcgList}" var="cg">
                <span id="cgName" style="visibility: hidden;">${cg.vtcgName}</span>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="vtcgNo" id="${cg.vtcgNo}" value="${cg.vtcgNo}" required>
                
                <label class="form-check-label" for="${cg.vtcgNo}"  id="${cg.vtcgNo}">${cg.vtcgName}</label>
                <input type="hidden" name="cgCnt" value="${cg.vtcgCnt}">
            </div>
        </c:forEach>
        
        <!-- <div>대상자수 : ${fn:length(vtptList) }</div>
        <div >참여 인원수 : <span id="cg"></span></div>
        <div>참여율 :<span id="pt"></span></div> -->

        </div>
    </div>

    
    <div class="chart" style="float: left;">
        <%@include file="/WEB-INF/views/vote/detail-uChart.jsp" %>    
    </div>
    </div>
</div>

<script>
    //var cnt = (document.getElementById('cgCnt').value);
    var cnt = (document.querySelectorAll('span[id="cgCnt"]'));
    var c = 0;
    console.log("cnt::"+cnt);
    

    var cglength = ${fn:length(vtcgList) };
    console.log(cglength);
    var cgname = document.querySelectorAll("span[id='cgName']");
    console.log("cg::"+cgname);
</script>

