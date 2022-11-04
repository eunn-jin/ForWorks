<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

            <h3><label for="">번호. </label>&nbsp;<label for="">${vtvo.vtTitle}</label></h3>
            <label class="text-subtitle text-muted">투표자</label>
            <p class="text-subtitle text-muted" style="font-weight: 900;">기간:${vtvo.vtCreate}~${vtvo.vtEnd}</p>
            
            
            <div class="md-3"> 
                <label for="title" class="form-label">내용</label>
                <div>${vtvo.vtContent}</div>
            </div>
            <br>
            <c:forEach items="${vtcgList}" var="cg">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="vtcgNo" id="${cg.vtcgNo}" value="${cg.vtcgNo}" required>
                <label class="form-check-label" for="${cg.vtcgNo}">
                    ${cg.vtcgName}
                </label>
            </div>
        </c:forEach>

            
        </div>
    </div>
    
    <div class="chart" style="float: left;">
        <div class="kk"></div>
    </div>
</div>

