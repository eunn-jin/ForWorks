<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="alertMsg" value="${sessionScope.alertMsg }"/>
<c:remove var="alertMsg" scope="session"/>
<c:if test="${not empty alertMsg }">
	<script>
		alert('${alertMsg}');
	</script>
</c:if> 
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
#comment-bot>div, #comment-bot2>div{
    width: 80%;
    display: inline-block;
}
        
#comment-bot>span, #comment-bot2>span{
    width: 10%;
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
                                    <td  style=" background : white; width: 30%;">${cmuvo.empNo}</td>
                                    <td style="width: 15%;" class="danger">대상</td>
                                    <td  style="background: white; width: 30%;">
                                        <div>${cmuvo.cmuRead}</div>
                                    </td>
                                    <td style="background: white; border:0;">
                                        <a href="${root}/community/list/1">
                                            <button type="button" class=" myBtn">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door-fill"
                                                    viewBox="0 0 16 16">
                                                    <path d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"></path>
                                                </svg>
                                            </button>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="danger">제목</td>
                                    <td colspan="3"><div>${cmuvo.cmuTitle}</div></td>
                                </tr>
    
    
                                <tr>
                                    <td class="danger">글내용</td>
                                    <td colspan="3" style=" background : white; text-align: left;">
                                        <textarea id="summernote" name="content" class="form-control" style="background-color: white; text-align: left; height: 30vh;" disabled
                                        >${cmuvo.cmuContent} 
                                        </textarea>
                                    </td>
                                </tr>
    
                                <tr>
                                    <td class="danger">첨부파일</td>
                                    <c:if test="${cmatVo eq null}">
                                        <td colspan="3"><div style="height: 10vh;">첨부파일이 없습니다.</div></td>
                                    </c:if>
                                    <c:if test="${cmatVo ne null}">
                                        <td colspan="3"><div >
                                            <img src="${root}/resources/upload/commu/${cmatVo.cmatChange}" width="128px" height="128px"/>
                                        </div></td>
                                    </c:if>
                                </tr>
                                
                                <tr>
                                    <td >
                                        <div>댓글</div>
                                    </td>
                                    <td colspan="3" style=" background : white; text-align: left;">
                                        <input type="text" id="comment-content" name="cmtContent" type="text" class="form-control" style="width:90%; display: inline;">
                                        <!-- <textarea id="comment-content" name="cmtContent" type="text" class="form-control" style="width:90%; display: inline;"></textarea> -->
                                        <button id="comment-btn" style="border: 0; outline: 0; background : white;" >
                                            <img src="${root}/resources/img/comment.png" alt="" width="70px" height="70px">
                                        </button>
                                    </td>

                                </tr>

                                <tr>
                                    <td>댓글내용</td>
                                    <td colspan="3" style="height: 20vh;" id="cm-list" >
                                        <div id="comment-list" style="text-align: left; "><div id="comment-bot"><div>내용</div><span>작성자</span></div></div>
                                        <hr>
                                        
                                        <div id="comment-list" style="text-align: left; overflow-y: scroll; height: 20vh;" >
                                            <c:forEach items="${cmtList}" var="cm">
                                                <div id="comment-bot2">
                                                    
                                                    <input type="hidden" id="comment-no" value="${cm.cmtNo}">
                                                    <div id="d">${cm.modifiyDate}</div>
                                                    <div id="c">${cm.cmtContent}</div>
                                                    <span id="n">${cm.empNo}</span>
                                                    &emsp;
                                                    
                                                    <button type="button" class=" btn-secondary" id="cmt-delete" style="border: 0;">
                                                        <i class="bi bi-x-square"></i>
                                                    </button>
                                                    
                                                    <hr>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    
                                    </td>
                                </tr>
                            <!-- <div>${cmuvo}</div> -->
                            
                            <c:if test="${loginMember.empNo eq cmuvo.num}">
                                <tr>
                                    <td colspan="4" class="text-end" style="border:none; background : white; ">
                                        <input type="hidden" name="num" value="">
                                        <a href="${root}/community/update/${cmuvo.cmuNo}"><button type="button" id="upDate" class="mybtn">수정</button></a>
                                        <a href="${root}/community/delete/${cmuvo.cmuNo}" ><button type="button" id="delete" class="myBtn">삭제하기</button></a>
    
                                    </td>
                                    
                                </tr>
                            </c:if>
                        </div>
                    </form> 

                </div>
            </div>
        </div>

        <script>
                const cmtNum=document.querySelector('#comment-no').value;
                console.log(cmtNum);
        </script>

        <script>
	
            const cmtBtn = document.querySelector('#comment-btn');
            
            cmtBtn.addEventListener('click' ,  function(){
                const commentContent = document.querySelector('#comment-content').value;
                console.log(commentContent);
                const cmuNo = ${cmuvo.cmuNo};
                const commentWriterName = '${sessionScope.loginMember.empName}';
                console.log(commentWriterName);
                $.ajax({
                    url : "${root}/comments/write",
                    type : "POST",
                    data : {
                            "cmtContent" : commentContent,
                            "cmuNo" : cmuNo 
                    },
                    success : function(result){
                        if (result =='ok') {
                            alert("댓글 등록!");
                            
                            const target = document.querySelector('#comment-list');
                            
                            $(target).prepend('<div id="comment-bot2"><div>'+commentContent+'</div><span>'+commentWriterName+'</span><hr></div>');
                            
                            //기존 입력 내용 지우기
                            document.querySelector('#comment-content').value = '';
                        }
                        else{
                            alert("댓글 작성 실패..");
                        }
                    },
                    error : function(){
                        alert("통신 에러..");	
                    },
                });
            });
        </script>



<script>
	
    const cmtDet = document.querySelector('#cmt-delete');
    cmtDet.addEventListener('click' ,  function(){
        //댓글 번호 가져오기
        const cmtNum=document.querySelector('#comment-no').value;
        console.log(cmtNum);
        
        $.ajax({
            url : "${root}/comments/delete",
            type : "POST",
            data : {
                    "cmtNo" : cmtNum 
            },
            success : function(result){
                if (result =='ok') {
                    alert("삭제완료!");
                    
                    const target = document.querySelector('#comment-bot2');
                    console.log(target);
                    target.remove();

                }else{
                    alert("댓글 삭제 실패..");
                }
            },
            error : function(){
                alert("통신 에러..");	
            },
        });
    });


</script>