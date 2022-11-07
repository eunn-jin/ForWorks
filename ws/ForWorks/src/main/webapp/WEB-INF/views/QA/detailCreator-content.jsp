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
            <label class="text-subtitle text-muted">설문생성자</label>
            <p class="text-subtitle text-muted">설문기간 0000.00.00~1111.11.11</p>
            
            
            <div class="md-3"> 
                <label for="title" class="form-label">내용</label>
                <input type="text" class="form-control" id="title" name="title" >
            </div>
            <br>
            <div class="md-3"> 
                <label for="title" class="form-label">항목1</label>
                <input type="text" class="form-control" id="title" name="title" value="항목 1번에대해 서술한내용" disabled>
            </div>

            <div class="md-3"> 
                <label for="title" class="form-label">항목1</label>
                <input type="text" class="form-control" id="title" name="title" value="항목 1번에대해 서술한내용" disabled>
            </div>


            <div class="md-3"> 
                <label for="title" class="form-label">항목1</label>
                <input type="text" class="form-control" id="title" name="title" value="항목 1번에대해 서술한내용" disabled>
            </div>

        </div>
    </div>
    
    <div class="chart" style="float: left;">
        <div class="kk" >
            <div class="mglt" style="margin-top: 30px;">
                <h3><label for="">답변내용</label></h3>
                <label class="text-subtitle text-muted">항목1</label>
            </div>
            <div id="list" style="overflow-y:scroll; margin-left: 10%;">
            <table class="table" id="table-main">
                <thead class="table-light">
                    <tr id="center">
                        <th scope="col" style="width: 20%;">사원명</th>
                        <th scope="col" >내용</th>
                    </tr>
                </thead>

                <%int i=0; %>
                <c:forEach begin="1" step="1" end="10">
                    <tbody>
                        <tr id="center">

                            <th scope="row" >가나다</th>
                            <td >답변내용ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</td>
                        </tr>
                    </tbody>
                    </c:forEach>
                    </table>
</div>
        </div>
    </div>
</div>