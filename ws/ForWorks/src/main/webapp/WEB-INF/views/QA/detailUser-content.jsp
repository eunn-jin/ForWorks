<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${root}/resources/css/sjy.css">
<style>
    .cic{
        
        height: 60vh;
        border-left: 1px dashed rgba(121, 121, 121, 0.555);
        
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

            <form action="">
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
                        답변:<input type="text" name="qaawContent" class="form-control" style="display: inline; font-weight: 200; width: 85%;" value="${chaw[status.index].qaawContent } "></input>
                    </c:when>
                </c:choose>
                </form>
                

            </div>
            </c:forEach>



        </div>
    </div>   

    <script>
        var x = '${chaw}';
        console.log(${fn:length(chaw)});
        console.log(${check});
        console.log("cccc:: "+x.length);
    </script>



