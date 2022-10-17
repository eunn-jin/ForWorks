<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${root}/resources/css/sjy.css">
<style>
tr:hover{
    cursor: pointer;
    background-color: rgba(128, 128, 128, 0.425);
}
tr>th:hover{
    cursor: default; 
}
.b{
    color:black;
}
</style>
<!-- 검색박스 -->
<div id="content" >
<div id="search">
    <div id="search-box">
        검색
    </div>
</div>

<!-- 공지사항 리스트박스 -->
<div id="notice">
<div id="list" style="overflow:auto;">

    <table class="table" id="table-main">
        <thead class="table-light">
            <tr id="center">
                <th scope="col">#</th>
                <th scope="col" colspan="5">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">열람대상</th>
                <th scope="col">조회수</th>
                <th scope="col">등록일자</th>
            </tr>
        </thead>

        <%int i=0; %>
            <c:forEach begin="1" step="1" end="10">
                <tbody>
                    <tr id="center">

                        <th scope="row">1</th>
                        <td colspan="5">전체 공지사항ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>

                        <td>Mark</td>
                        <td>전체</td>
                        <td>11</td>
                        <td>22-10-05</td>
                    </tr>
                </tbody>
            </c:forEach>
            <td colspan="10" style="border:none; cursor: default; background: white;">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link"><</a>
                    </li>
                    <li class="page-item active" aria-current="page">
                        <a class="page-link b" href="#">1</a>
                    </li>
                    <li class="page-item"><a class="page-link b" href="#">2</a></li>
                    <li class="page-item"><a class="page-link b" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link b" href="#">></a>
                    </li>
                </ul>
            </td>

    </table>
</div>
<div style="text-align: right;">
    <a href="/forworks/notice/noticeWrite"><button class="myBtn" style="margin-right: 18%;">글작성</button></a>
</div>

<!-- <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link"><</a>
            </li>
            <li class="page-item active" aria-current="page">
                <a class="page-link b" href="#">1</a>
            </li>
            <li class="page-item"><a class="page-link b" href="#">2</a></li>
            <li class="page-item"><a class="page-link b" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link b" href="#">></a>
            </li>
        </ul>
    </nav>     -->
</div>
</div>
<script>
    $(function(){
        $('#table-main>tbody>tr').click(function(){
            //행 클릭 되었을때, 동작할 내용

            //글번호 가져오기
            const num = $(this).children().eq(0).text();
            
            //해당 번호로 요청 보내기
            location.href='${root}/notice/noticeDetail?num=' + num;
            
        });
    })
</script>
