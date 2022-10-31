<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<td>${loginMember.empName}</td>
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
							<td>지급금액(원)</td>
						</tr>

						<tr>
							<td>기본급</td>
							<td>${result.empMoney}</td>
							<td>소득세</td>
							<td>20,000</td>
						</tr>

						<tr>
							<td>수당</td>
							<td></td>
							<td>국민연금</td>
							<td>90,000</td>
						</tr>

						<tr>
							<td>상여금</td>
							<td></td>
							<td>건강보험</td>
							<td>68,000</td>
						</tr>

						<tr>
							<td></td>
							<td></td>
							<td>고용보험</td>
							<td>16,000</td>
						</tr>

						<tr>
							<td>지급액 계</td>
							<td>2,000,000</td>
							<td>공제액 계</td>
							<td>194,000</td>
						</tr>

						<tr>
							<td>실지급액</td>
							<td></td>
							<td colspan="3">1,687,000</td>
							<td></td>
						</tr>
					</table>
					<br>
					<span>수당내역</span>
					<table>
						<tr>
							<td>수당명</td>
							<td>시간</td>
							<td>지급액(원)</td>
						</tr>
						
					</table>
					<span>상여금내역</span>
					<table>
						<tr>
							<td>상여명</td>
							<td>상여내역</td>
							<td>지급액(원)</td>
						</tr>
					</table>
				
			</div>
		</div>
		<button onclick="return window.print();">프린트</button>
          
           
	</div>

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>


</html>
