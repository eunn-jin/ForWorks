<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
</head>
<style>
    #wrap{
        background-color: white;
        width: 90vw;
        height: 90vh;
        font-size: 20px;
    }
    table{
        width: 100%;
        border: 1px solid black;
        text-align: left;
    }
    #title{
        text-align: center;
        font-size: larger;
        font-weight: bolder;
    }
    .back-color{
        background-color: #EEF1FF;
    }

</style>
<body>

<div id="app">

	<div id="main">
           
		   <div id="wrap">
			<div id="title">급여명세서</div>
			<div>${result.salMonth}</div>
			<div id="center">
				
					<table>
						<tr>
							<td>성명</td>
							<td>${result.empName}</td>
						</tr>
						<tr>
							<td>지급일</td>
							<td>${result.payDate}</td>
						</tr>
					</table>
					<br>
					<table>
						<tr>
							<td colspan="2">임금지급내역</td>
							<td colspan="2">공제내역</td>
						</tr>
						<tr>
							<td>임금항목</td>
							<td>지급금액(원)</td>
							<td>공제항목</td>
							<td>공제금액(원)</td>
						</tr>

						<tr>
							<td>기본급</td>
							<td>${result1[0].empMoney}</td>
							<td>소득세</td>
							<td>${result.tax1}</td>
						</tr>

						<tr>
							<td>수당</td>
							<td>${result.amount}</td>
							<td>국민연금</td>
							<td>${result.tax2}</td>
						</tr>

						<tr>
							<td>상여금</td>
							<td>${result.bonusSum}</td>
							<td>건강보험</td>
							<td>${result.tax3}</td>
						</tr>

						<tr>
							<td></td>
							<td></td>
							<td>고용보험</td>
							<td>${result.tax4}</td>
						</tr>

						<tr>
							<td>지급액 계</td>
							<td>${result.sum}</td>
							<td>공제액 계</td>
							<td>${result.sumxtax}</td>
						</tr>

						<tr>
							<td>실지급액</td>
							<td></td>
							<td colspan="3">
								${result.sum - result.sumxtax}(원)
							</td>
							<td></td>
						</tr>
					</table>
					<br>
					<span>수당내역</span>
					<table>
						<tr>
							<td>수당명</td>
							<td>시간(분)</td>
							<td>지급액(원)</td>
						</tr>
						<c:if test="${result1 ne null}">
							<c:forEach items="${result1}" var="x">
							<tr>
								<td>${x.cate}</td>
								<td></td>
								<td>${x.amount}</td>
							</tr>
							</c:forEach>
							<tr>
								<td>초과수당</td>
								<td>${result1[0].addOverTime}</td>
								<td>${result1[0].addCalc}</td>
							</tr>
						</c:if>
						
					</table>
					<span>상여금내역</span>
					<table>
						<tr>
							<td>상여명</td>
							<td>상여내역</td>
							<td>지급액(원)</td>
						</tr>
						<c:if test="${result2 ne null}">
							<c:forEach items="${result2}" var="x">
							<tr>
								<td>${x.title}</td>
								<td>${x.content}</td>
								<td>${x.payment}</td>
							</tr>
							</c:forEach>
						</c:if>
					</table>
				
			</div>
		</div>
		<button onclick="return window.print();">프린트</button>
          
           
	</div>

</div>

<script>
	
</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>


</html>
