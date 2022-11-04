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
            <p class="text-subtitle text-muted">${vtvo.vtCreate}~${vtvo.vtEnd}</p>
            
            
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
        <div>대상자수 : ${fn:length(vtptList) }</div>
        <div >참여이원수 : <span id="cg"></span></div>
        <div>참여율 :<span id="pt"></span></div>
        <div>${vtcgList[0].vtcgName}</div>
    </div>
    <div class="chart" style="float: left;">
        
        	<%@include file="/WEB-INF/views/vote/detail-chart.jsp" %>
        
    </div>
</div>



<script>
    var cnt = (document.querySelectorAll('span[id="cgCnt"]'));
    var c = 0;
    console.log(cnt);
    
    for(var i =0; i<cnt.length;i++){
        console.log(cnt[i].textContent);
        console.log(isNaN(Number(cnt[i].textContent)));
        c= c + Number(cnt[i].textContent);
    }
    console.log("c::"+c);
    var x =${fn:length(vtptList) };
    var y = c;
    console.log((y/x)*100);
    var av = (y/x)*100;
    document.getElementById('cg').innerHTML=c;
    document.getElementById('pt').innerHTML=av+"%";
</script>

<script>

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