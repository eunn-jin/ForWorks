<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="notice" style="text-align: left;width: 100%;">
    <div id="list" style="overflow: auto; width: 100%;">
        
        <table class="table" id="table-main">
            <thead class="table-light">
                <tr id="center">
                    <th scope="col">#</th>
                    <th scope="col" colspan="5">제목</th>
                    <th scope="col">진행자</th>
                    <th scope="col">상태</th>
                    <th scope="col">시작일</th>
                    <th scope="col">종료일</th>
                </tr>
            </thead>
            
            <c:forEach items="${vtEndList}" var="vte">
                
                <tbody id="tbd">
                    <tr id="center">
                        <input type="hidden" value="${vte.vtNo}">
                        <th scope="row">${vte.rownum}</th>
                        <td colspan="5">${vte.vtTitle}</td>
                        <input type="hidden" value="${vte.num}">
                        <td >${vte.empNo}</td>
                        <td>마감</td>
                        <td>${vte.vtCreate}</td>
                        <td>${vte.vtEnd}</td>
                    </tr>
                </tbody>
            </c:forEach>
            <td  colspan="10" style="border:none; cursor: default; background: white;">

                <ul class="pagination justify-content-center">
                    
                    <c:if test="${pvend.startPage ne 1 }">	
                        <li><a href="${root}/vote/list/1" class="page-link b disabled">처음</a></li>
                        <li class="page-item"><a href="${root}/vote/list/${pvend.startPage -1 }" class="page-link">이전</a></li>
                    </c:if>

                    

                    <c:forEach begin="${pvend.startPage }" end="${pvend.endPage }" var="i">
                        <li class="page-item " aria-current="page">
                            <a class="page-link b" href="${root}/vote/list/${i}">${i}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pvend.endPage ne pvend.maxPage }">
                        <li><a class="page-link b" href="${root}/vote/list/${pvend.endPage +1 }">다음</a></li>
                        <li><a href="${root}/vote/list/${pvend.maxPage }" class="page-link b">끝</a></li>
                    </c:if>
                </ul>
            
            </td>

        </table>
    </div>
    <!-- 생성권한이 있는 사람만 -->
    <div style="text-align: right;">
        <a href="/forworks/vote/create"><button class="myBtn"
                style="margin-right: 5%;">투표생성</button></a>
    </div>

</div>