<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
            <c:forEach items="${ntList }" var="nt">
                <tbody id="tbd">
                    <tr id="center">

                        <th scope="row">${nt.ntno }</th>
                        <td colspan="5">${nt.ntTitle }</td>

                        <td>${nt.empNo }</td>
                        <td>${nt.ntAccess }</td>
                        <td>${nt.ntCnt }</td>
                        <td>${nt.ntEnrollDate }</td>
                    </tr>
                </tbody>
            </c:forEach>
            <td  colspan="10" style="border:none; cursor: default; background: white;">
            
                <ul class="pagination justify-content-center">
                    
                    <c:if test="${pv.startPage ne 1 }">	
                        <li><a href="${root}/notice/list/1" class="page-link b disabled">처음</a></li>
                        <li class="page-item"><a href="${root}/notice/list/${pv.startPage -1 }" class="page-link">이전</a></li>
                    </c:if>

                    

                    <c:forEach begin="${pv.startPage }" end="${pv.endPage }" var="i">
                        <li class="page-item " aria-current="page">
                            <a class="page-link b" href="${root}/notice/list/${i}">${i}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pv.endPage ne pv.maxPage }">
                        <li><a class="page-link b" href="${root}/notice/list/${pv.endPage +1 }">다음</a></li>
                        <li><a href="${root}/notice/list/${pv.maxPage }" class="page-link b">끝</a></li>
                    </c:if>
                </ul>
            
            </td>

    </table>
</div>
<div style="text-align: right;">
    <a href="/forworks/notice/write"><button class="myBtn" style="margin-right: 18%;">글작성</button></a>
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
        $('#table-main>tbody>#center').click(function(){
            //행 클릭 되었을때, 동작할 내용

            //글번호 가져오기
            const num = $(this).children().eq(0).text();
            
            //해당 번호로 요청 보내기
            location.href='${root}/notice/detail/'+num;
            
        });
    })
</script>

