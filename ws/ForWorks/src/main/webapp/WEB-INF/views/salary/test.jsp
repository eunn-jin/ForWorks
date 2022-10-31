<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>SummerNoteExample</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
  <!--  -->
  <style>
    #wrap{
        align-items: left;
    }
  </style>
</head>
<body>
    <form action="">
        <div id="wrap">
            <div>보존 마감 날짜</div>
            <div><input type="date"></div>
            <div>공개범위</div>
            <div>전체공개</div>
            <div>제목</div>
            <div><input type="text"></div>
            <div>첨부파일</div>
            <div><input type="file"></div>
            <div>내용</div>
            <div class="container">
                <textarea class="summernote" name="editordata"></textarea>    
            </div>
        </div>
        </form>
<script>
$('.summernote').summernote({
	  height: 150,
	  lang: "ko-KR"
	});


</script>
</body>
</html>