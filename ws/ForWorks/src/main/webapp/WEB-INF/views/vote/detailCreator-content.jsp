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
            
                
            <h3><label for="">번호. </label>&nbsp;<label for="">${vtvo.vtTitle}</label></h3>
            <label class="text-subtitle text-muted">생성자: ${vtvo.empNo}</label>
            <p class="text-subtitle text-muted" style="font-weight: 900;">${vtvo.vtCreate}~${vtvo.vtEnd}</p>
            
            
            <div class="md-3"> 
                <label for="title" class="form-label">내용</label>
                <div>${vtvo.vtContent}</div>
            </div>
            <br>

            <div class="md-3"> 
                <c:forEach items="${vtcgList}" var="cg">
                    <label for="cgName" class="form-label">${cg.vtcgName}</label>
                    <!-- <input type="text" class="form-control" id="title" name="title" value="${cg.vtcgCnt}명" disabled> -->
                    <div style="background: rgba(128, 128, 128, 0.247); padding: 5px; border-radius: 5px;" ><span id="cgCnt">${cg.vtcgCnt}</span><span>명</span></div>
                </c:forEach>
            </div>
        </div>

        
    </div>
    <div class="chart" style="float: left;">    
            <%@include file="/WEB-INF/views/vote/detail-chart.jsp" %>    
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
                    <h2>대상자수 : ${fn:length(vtptList) }</h2>
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
    
    
                                <c:forEach items="${vtptList}" var="vt">
                                <tbody id="tbd">
                                    <tr id="center">
                                        
                                        <th scope="col" colspan="5">${vt.empName}</th>
                                        <th scope="col">${vt.deptName}</th>
                                        <th scope="col">${vt.vtptStatus}</th>
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
    var cnt = (document.querySelectorAll('span[id="cgCnt"]'));
    var c = 0;
    console.log("cnt"+cnt);
    
    for(var i =0; i<cnt.length;i++){
        console.log(cnt[i].textContent);
        //console.log(isNaN(Number(cnt[i].textContent)));
        c= c + Number(cnt[i].textContent);
    }
    console.log("c::"+c);
    var x =${fn:length(vtptList) };
    var y = c;
    console.log((y/x)*100);
    var av = ((y/x)*100).toFixed(1);
    document.getElementById('cg').innerHTML=c;
    document.getElementById('pt').innerHTML=av+"%";
</script>

<script>
    
    var cglength = ${fn:length(vtcgList) };
    
    var cgname = document.querySelectorAll("label[for='cgName']");
    console.log("cg"+cgname);
    

    var myArray = {id1: 100, id2: 200, "tag with spaces": 300};
    console.log(myArray);
    // var x = $("label[for='cgName']");
    // for (let i = 0; i < x.length; i++) {
    //     console.log("x::"+x[i]);
        
    // }
    // var y = $("span[id='cgCnt']").text();
    // console.log("y::"+y);
    // for (var i = 0; i < ${fn:length(vtcgList)}; i++) {
    //     console.log("i::"+i);
    //     x = ${vtcgList[0].vtcgName}
    //     console.log("x::"+x);
    //     y = ${vtcgList[0].vtcgCnt}
    //     console.log("y::"+y);
    // }
</script>