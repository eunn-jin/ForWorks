<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${root}/resources/css/sjy.css">
<style>
    div,input{margin-bottom: 1%;}
    .nbtn{
    padding: 0;
    border: none;
    background: none;
    }
    
    
</style>
<div id="container" style="margin: 3% 5%;">
        <form action="">
            
                <div class="md-3"> 
                    <label for="title" class="form-label">제목</label>
                    <input type="text" class="form-control" id="title" name="title" style="height: 10vh;">
                    <br>
                </div>
            
                <div class="md-3">
                    <input type="file" class="form-control" style="width: 50%;">
                </div>
                <hr>
                
                <div class="md-3"> 
                    <label for="title" class="form-label">내용</label>
                    <input type="text" class="form-control" id="title" name="title" style="width: 50%;">
                </div>

                <div class="md-3"> 
                    
                    <label for="title" class="form-label">설문기간</label><br>
                    <input type="date" class="form-control" id="title" name="title" style="width: 24.5%;display: inline;">~
                    <input type="date" class="form-control" id="title" name="title" style="width: 24.5%; display: inline;">
                </div>

                <div class="md-3"> 
                    <label for="title" class="form-label">대상자</label>    &nbsp;&nbsp;&nbsp;
                    <input type="radio"  id="title" name="title" checked><label for="">전체</label>
                    <input type="radio"  id="title" name="title" ><label for="">부서선택</label>
                </div>
                
                <div class="md-3"> 
                    <label for="title" class="form-label">항목</label><br>

                    <input type="text" class="form-control" id="title" name="title" style="width: 50%; display: inline;">
                    <button class="nbtn">x</button>

                    <input type="text" class="form-control" id="title" name="title" style="width: 50%; display: inline;">
                    <button class="nbtn">x</button>

                    <input type="text" class="form-control" id="title" name="title" style="width: 50%; display: inline;">
                    <button class="nbtn">x</button>
                </div>
                <button class="nbtn">+ 항목 추가</button>
                
        </form>
        
</div>