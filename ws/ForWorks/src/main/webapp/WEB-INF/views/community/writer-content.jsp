<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${root}/resources/css/sjy.css">    
<script src="${root }/resources/js/summernote/summernote-lite.js"></script>
<script src="${root }/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="${root }/resources/css/summernote/summernote-lite.css">
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


<form action="" method="post">
    
    
        <div id="wcontent">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <form action="" method="post">
                        <div class="table table-responsive">
                            <table class="table table-striped">
                                <tr>
                                    <td class=""><label for="writer" class="form-label">작성자</label> </td>
                                    <td  style="border:1px solid black; background : white;">ㅁㅁㅁ</td>
                                    <td ><label for="department" class="form-label">공개범위</label></td>
                                    <td  style="background: white;">
                                        <select name="" id="department" >
                                            <option value="" selected >선택</option>
                                            <option>전체</option>
                                            <option>나의부서</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td ><label for="title" class="form-label">제목</label></td>
                                    <td colspan="3"><input type="text" class="form-control" name="title" id="title" value=""></td>
                                </tr>
    
    
                                <tr>
                                    <td ><label for="cotent" class="form-label">내용</label></td>
                                    <td colspan="3" style=" background : white; text-align: left;"><textarea id="summernote" name="content" class="form-control" style="background-color: white;" ></textarea></td>
                                </tr>
    
                                <tr>
                                    <td ><label for="nf" class="form-label">첨부파일</label></td>
                                    <td colspan="3"><input type="file" class="form-control" name="nf"></td>
                                </tr>
                                
                                <tr>
                                    <td colspan="4" class="text-end" style="border:none; background : white;">
                                        <input type="hidden" name="num" value="현재글번호">
                                        <input type="submit" value="작성하기" class="myBtn">
    
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