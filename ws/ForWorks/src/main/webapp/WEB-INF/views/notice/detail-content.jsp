<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<link rel="stylesheet" href="${root}/resources/css/sjy.css">
<style>
	table{margin: auto;}
tr, td{
    border: 1px solid rgba(0, 0, 0, 0.144);
    margin: auto;
    text-align: center;
    vertical-align: middle;
}


table {
    border-spacing: 0;
    border-collapse: initial;
}


table {
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    text-indent: initial;
    border-spacing: 2px;
    border-color: grey;
}
</style>
<link rel="stylesheet" href="${root}/resources/css/sjy.css">
<script src="${root }/resources/js/summernote/summernote-lite.js"></script>
<script src="${root }/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="${root }/resources/css/summernote/summernote-lite.css">

<form action="">
    
    
        <div id="wcontent">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <form action="" method="post">
                        <div class="table table-responsive">
                            <table class="table table-striped">
                                <tr>
                                    <td class="" style="width: 15%;">작성자</td>
                                    <td  style=" background : white; width: 30%;">${ntvo.empNo}</td>
                                    <td style="width: 15%;" class="danger">대상</td>
                                    <td  style="background: white; width: 30%;">
                                        <div>${ntvo.ntAccess}</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="danger">제목</td>
                                    <td colspan="3"><div style="text-align: left;">${ntvo.ntTitle}</div></td>
                                </tr>
    
    
                                <tr>
                                    <td class="danger">글내용</td>
                                    <td colspan="3" style=" background : white; text-align: left;">
                                        <!-- <textarea id="summernote" name="content" class="form-control" style="background-color: white; text-align: left; height: 30vh;" disabled >${ntvo.ntContent}
                                        </textarea> -->
                                        <div style="background-color: white; text-align: left; height: 30vh;" th:utext="${ntvo.ntContent}">${ntvo.ntContent}</div>
                                    </td>
                                </tr>
    
                                <tr>
                                    <td class="danger">첨부파일</td>
                                    <c:choose>
                                    	<c:when test="${ntatVo eq null}">
                                        	<td colspan="3"><div style="height: 10vh;">첨부파일이 없습니다.</div></td>
                                    	</c:when>
                                    	
                                        <c:when test="${ext eq '.jpg' || ext eq '.png'}">
                                        <td colspan="3"><div >
                                            <a href="${root}/resources/upload/notice/${ntatVo.ntatChange}" download=""><img src="${root}/resources/upload/notice/${ntatVo.ntatChange}" width="128px" height="128px"></a>
                                        </div></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td colspan="3"><a href="${root}/resources/upload/notice/${ntatVo.ntatChange}" download="">${ntatVo.ntatChange}</a></td>
                                        </c:otherwise>
                                        
                                    </c:choose>
                                </tr>
                                
                                <c:if test="${loginMember.empNo eq ntvo.num}">
                                <tr>
                                    <td colspan="4" class="text-end" style="border:none; background : white; ">
                                        <input type="hidden" name="num" value="">
                                        <a href="${root}/notice/update/${ntvo.ntno}"><button type="button" id="upDate" class="mybtn">수정</button></a>
                                        <a href="${root}/notice/delete/${ntvo.ntno}" ><button type="button" id="delete" class="myBtn">삭제하기</button></a>
    
                                    </td>
                                    
                                </tr>
                            </c:if>
                        </div>
                    </form> 

                </div>
            </div>
        </div>
