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
    <div class="dcontent" style="float: left; ">
        <div class="mglt" style="margin-top: 30px;">

            <h3><label for="">번호. </label>&nbsp;<label for="">제목</label></h3>
            <label class="text-subtitle text-muted">투표생성자</label>
            <p class="text-subtitle text-muted">투표기간 0000.00.00~1111.11.11</p>
            
            
            <div class="md-3"> 
                <label for="title" class="form-label">내용</label>
                <input type="text" class="form-control" id="title" name="title" >
            </div>
            <br>
            <div class="md-3"> 

                <label for="title" class="form-label">항목1</label>
                <input type="text" class="form-control" id="title" name="title" value="_ _명" disabled>
            </div>
        </div>
    </div>
    
    <div class="chart" style="float: left;">
        <div class="kk"></div>
    </div>
</div>