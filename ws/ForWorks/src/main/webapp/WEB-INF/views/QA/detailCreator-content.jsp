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
    <div class="dcontent" style="float: left; ">
        <div class="mglt" style="margin-top: 30px;">
            
            <h3><label for="">번호. </label>&nbsp;<label for="">${qavo.qaTitle}</label></h3>
            <label class="text-subtitle text-muted">생성자: ${qavo.empNo}</label>
            <p class="text-subtitle text-muted" style="font-weight: 900;">${qavo.qaSdate}~${qavo.qaEdate}</p>
            
            
            <div class="md-3"> 
                <label for="title" class="form-label">내용</label>
                <div>${qavo.qaContent}</div>
            </div>
            <br>

            <div class="md-3"> 
            <c:forEach items="${qacgList}" var="cg">
                <input type="hidden" name="num" value="${cg.rownum}">
                <input  type="radio" id="${cg.rownum}" name="cgName" class="form-label" value="${cg.rownum}"><label for="${cg.rownum}" class="form-label">${cg.qacgName}</label><br>
            </c:forEach>
            </div>
        </div>

        
    </div>
    <div class="chart" style="float: left;">
        <div class="kk" style="height: 100%;padding-bottom: 5%;" >
            <div class="mglt" style="margin-top: 30px;">
                <h3><label for="">답변내용</label></h3>
                <label class="text-subtitle text-muted">항목 </label>
            </div>
                
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#all">전체</a></li>
	
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#ing">진행</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#end">마감</a></li>
			</ul>
            <div id="list" style="overflow-y:scroll;">
                <table class="table" id="table-main">
                    <thead class="table-light">
                        <tr id="center">
                            <th scope="col" style="width: 20%;">사원명</th>
                            <th scope="col">내용</th>
                        </tr>
                    </thead>

                        <tbody id="aw-list">
                            <c:forEach items='${qaawList}' var='aw'>
                                <tr id="answer">
                                    <c:if test='${aw.qacgNo eq 1}'>
                                        <th scope='row' id="aw-name">${aw.empName}</th>
                                        <td id="aw-content">${aw.qaawContent}</td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    <td colspan="2"></td>
                </table>
            </div>
        </div>
    </div>
        <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" style="text-align: right;"  data-bs-toggle="modal" data-bs-target="#exampleModal">
    대상자 명단
    </button>
    
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">대상자 명단</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="notice">
                    <h2>대상자수 : ${fn:length(qaptList) }</h2>
                    <h9 class="text-subtitle text-muted">참여 인원수 : <span id="cg"></span></h9>
                    <h9 class="text-subtitle text-muted">참여율 :<span id="pt"></span></h9>
                    <div id="list" style="overflow:auto;">
                        <table class="table" id="table-main">
                            <thead class="table-light">
                                <tr id="center">
                                    <th scope="col" colspan="5">이름</th>
                                    <th scope="col">부서명</th>
                                    <th scope="col">참가여부</th>
                                </tr>
                            </thead>
    
    
                                <c:forEach items="${qaptList}" var="qa">
                                <tbody id="tbd">
                                    <tr >
                                        <th scope="col" colspan="5">${qa.empName}</th>
                                        <th scope="col">${qa.deptName}</th>
                                        <th scope="col">${qa.qaptStatus}</th>
                                    </tr>
                                </tbody>
                                </c:forEach>
                        </table>
                            
            </div></div></div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            
            </div>
        </div>
        </div>
    </div>
</div>



<script>
    var n =[];
    var nn = ${fn:length(qacgList) };
    for(var i =1; i<=nn; i++){
        n.push(i);
    }
    console.log("n::"+n);
    
    var x =${fn:length(qaptList) };
    console.log("x::"+x);
    var y = ${checkNum};
    console.log("y::"+y);
    console.log((y/x)*100);
    var av = ((y/x)*100).toFixed(1);
    document.getElementById('cg').innerHTML=y;
    document.getElementById('pt').innerHTML=av+"%";
</script>

<script>
    
    var cglength = ${fn:length(qacgList) };
    
    var cgname = document.querySelectorAll("label[for='cgName']");
    console.log("cg"+cgname);
    



</script>

<script>
    //라디오 버튼 클릭시 id == aw-list 아래에 추가
    //c if test="${aw.qacgNo eq 1}" 1은 변동숫자
    //선택된 라디오 버튼 가져오기
    // $('#1').prop("checked",true);
    
    var x=  document.querySelector('#answer>th');
    var y=  document.querySelector('#answer>td');
    console.log("x::"+x);
    console.log("y::"+y);
    
    $('#answer').remove();
    

    <tr id="answer">
        <c:if test='${aw.qacgNo eq 1}'>
            <th scope='row' id="aw-name">${aw.empName}</th>
            <td id="aw-content">${aw.qaawContent}</td>
        </c:if>
    </tr>

    $('input[name=cgName]').change(function () {
        //라디오 버튼 선택값이 변경되면
        //현재 답변1이 보여지고있어서  answer 안의 내용 삭제

        //선택한 답변내용 보여주기

        x.remove();y.remove();
        
        $('#aw-list').append("<tr id='answer'>");
        <c:forEach items='${qaawList}' var='aw'>
                <c:if test='${aw.qacgNo eq 2}'>
                $('#aw-list').append("<th scope='row'>${aw.empName}</th>");
                $('#aw-list').append("<td>${aw.qaawContent}</td>");
            </c:if>
        </c:forEach>
        $('#aw-list').append("</tr>");
            


    })
    
</script>