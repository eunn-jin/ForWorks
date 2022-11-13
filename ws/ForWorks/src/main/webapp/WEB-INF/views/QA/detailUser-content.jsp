<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${root}/resources/css/sjy.css">
<style>
    .cic{
        
        height: 60vh;
        border-left: 1px dashed rgba(121, 121, 121, 0.555);
        
    }
    .ps{
        position: absolute;
        left: 35%;
        top: 77px;
    }
</style>
<div id="content" style="height: 70vh;">
    <div class="dcontent" style="float: left; margin-left: 25%; overflow-y: scroll;">
        <div class="mglt" style="margin-top: 30px;">

            <h3><label for=""></label>&nbsp;<label for="">${qavo.qaTitle}</label></h3>

            <!-- <label class="text-subtitle text-muted">투표자</label> -->
            <p class="text-subtitle text-muted" style="font-weight: 900;">기간:${qavo.qaSdate}~${qavo.qaEdate}</p>
            
            <div class="md-3"> 
                
                <label for="title" class="form-label">내용</label><h5>${qavo.qaContent}</h5>
            </div>

            <br>

            
            <c:forEach items="${qacgList}" var="cg" varStatus="status">
                <span id="cgName" style="visibility: hidden;">${cg.qacgName}</span>
            <div class="form-check">
                <label for="title" class="form-label">항목${cg.rownum}번</label>
                <input type="text" class="form-control" id="title" name="title" value="${cg.qacgName}" disabled>
                &nbsp;&nbsp;&nbsp;
                
                <c:set var="x" value="${fn:length(chaw)}"/>
                <c:set var="check" value="${check}"/>
                
                <i class="bi bi-arrow-return-right"></i>
                <c:choose>
                    <c:when test="${check == 0}">
                        대상자가 아닙니다.
                    </c:when>
                
                    <c:when test="${x == 0}">
                        댓글작성x
                        <input type="text" name="qaawContent" class="form-control" placeholder="댓글을 작성해주세요">
                    </c:when>
                    
                    <c:when test="${x != 0}">
                        답변:<input type="text" name="qaawContent" class="form-control" style="display: inline; font-weight: 200; width: 85%;" value="${chaw[status.index].qaawContent }"></input>
                    </c:when>
                </c:choose>
                
                

            </div>
            </c:forEach>



        </div>
        <a href="${root}/QA/list/1">
            <button type="button" class=" myBtn ps">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill"
                    viewBox="0 0 16 16">
                    <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"></path>
                </svg>
            </button>
        </a>
    </div>   

    <script>
        var x = '${chaw}';
        console.log(${fn:length(chaw)});
        console.log(${check});
        console.log("cccc:: "+x.length);
    </script>



