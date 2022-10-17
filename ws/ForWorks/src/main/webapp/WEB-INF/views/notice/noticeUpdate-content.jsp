<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${root}/resources/css/sjy.css">
<style>
	table{margin: auto;}
tr, td{
    border: 1px solid black;
    margin: auto;
    text-align: center;
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
                            <table class="table table-striped" >
                                <tr>
                                    <td class="">작성자</td>
                                    <td  style="border:1px solid black; background : white;">ㅁㅁㅁ</td>
                                    <td class="danger">대상</td>
                                    <td  style="background: white;">
                                        <select name="" id="" >
                                            <option value="" selected >부서를 선택해주세요</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>D</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="danger">제목</td>
                                    <td colspan="3"><input type="text" class="form-control" name="subject" value="전체 공지사항"></td>
                                </tr>
    
    
                                <tr>
                                    <td class="danger">글내용</td>
                                    <td colspan="3" style=" background : white; text-align: left;"><textarea id="summernote" name="content" class="form-control" style="background-color: white;" >입력되었던내용 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!</textarea></td>
                                </tr>
    
                                <tr>
                                    <td class="danger">첨부파일</td>
                                    <td colspan="3"><input type="file" class="form-control" name="f"></td>
                                </tr>
                                
                                <tr>
                                    <td colspan="4" class="text-end" style="border:none; background : white;">
                                        <input type="hidden" name="num" value="">
                                        <input type="submit" value="수정하기" class="myBtn" >
    
                                    </td>
                                </tr>
                        </div>
                </div>
            </div>
        </div>
    

</form> 

<script>
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
          
	});
});
</script>   

<script>
    $(function(){
        $('#upDate').click(function(){
            //해당 번호로 요청 보내기
            location.href="${root}/notice/noticeUpdate?num=" ;
            
            
        });
    })
</script>