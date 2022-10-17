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

            <h3><label for="">번호. </label>&nbsp;<label for="">제목</label></h3>
            <label class="text-subtitle text-muted">설문생성자</label>
            <p class="text-subtitle text-muted">설문기간 0000.00.00~1111.11.11</p>
            
            
            <div class="md-3"> 
                <label for="title" class="form-label">내용</label>
                <input type="text" class="form-control" id="title" name="title" >
            </div>
            <br>
            <div class="md-3"> 
                <label for="title" class="form-label">항목1</label>
                <input type="text" class="form-control" id="title" name="title" value="항목 1번 질문" disabled>
                &nbsp;&nbsp;&nbsp;<i class="bi bi-arrow-return-right"></i><label for="">답변내용:</label><div></div><br>
            </div>

            <div class="md-3"> 
                <label for="title" class="form-label">항목1</label>
                <input type="text" class="form-control" id="title" name="title" value="항목 1번 질문" disabled>
                &nbsp;&nbsp;&nbsp;<i class="bi bi-arrow-return-right"></i><label for="">답변내용:</label><div></div><br>
            </div>


            <div class="md-3"> 
                <label for="title" class="form-label">항목1</label>
                <input type="text" class="form-control" id="title" name="title" value="항목 1번 질문" disabled>
                &nbsp;&nbsp;&nbsp;<i class="bi bi-arrow-return-right"></i><label for="">답변내용:</label><div></div><br>
            </div>

        </div>
    </div>
    

</div>