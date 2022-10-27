<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Calendar"%>    

    <%@
    String yy=request.getParameter("year");
    String mm=request.getParameter("month");
    Calendar cal = Calendar.getInstance();
    
    int y = cal.get(Calendar.YEAR);
    int m = cal.get(Calendar.MONTH);
    
    if(yy != null && mm != null && !yy.equals("") && !mm.equals("")) {
        y = Integer.parseInt(yy);
        m = Integer.parseInt(mm)-1;
    }

    cal.set(y,m,1); //출력 년,월의 1일날의 요일
    int dayOfweek = cal.get(Calendar.DAY_OF_WEEK); // 2, 일:1 ~ 토: 7
    int lastday = cal.getActualMaximum(Calendar.DATE);
    %>
        

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>

<style>

   

    html, body{
        padding: 0px;
        margin: 0px;
        font: size 9px;
        color:#555555;
    }

    table{
        border-collapse:collapse;
    }

    th, td{
        border:1px solid #cccccc;
        width: 50px;
        height: 25px;
        text-align: center;
    }

    div, aside, main, header, input {
        box-sizing: border-box;
    }

    aside{ 
        width: 300px;
        height: 100vh;
    }
    
    main{
    	width: 100%;
    	margin-left:300px;
    }
    
    #wrap{
        display: flex;
    }
    
    a{
    	text-decoration: none;
    }

    main{
        background-color: #EEF1FF;
        padding-left: 40px;
        padding-right: 100px;
        padding-top: 45px;
    }

    #main-header{
        font-weight: 800;
        font-size: 30px;
        color: #6F5CFA;
        margin-bottom: 35px;
    }

    #main-wrap{
       width: 100%;
       font-family: 'Inter', sans-serif;
       display: flex;
       flex-direction: column;
    }

  

    
    
    

</style>

</head>
<body>

        <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
        
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
    <div id="wrap">

        <main>
            
            <div id="main-wrap">

                <div id="main-header">일정</div>
                
                	<setion>
                		<article>
                		 	<table>
                    <caption>
                        <%=y%>년 <%=m+1%>월
                    </caption>
                    <tr>
                        <th>일</th>
                        <th>월</th>
                        <th>화</th>
                        <th>수</th>
                        <th>목</th>
                        <th>금</th>
                        <th>토</th>
                    </tr>
                    <tr>
                    <%
                    int count = 0;
                    for(int s=1; s<dayOfweek; s++) {
                        out.print("<td></td>");
                        count++;
                    }
                    for(int d=1; d<=lastday; d++) {
                        count++;
                    
                        String color="#555555";
                        if(count == 7) {
                            color = "blue";
                        } else if(count == 1) {
                            color = "red";
                        }
                    %>
                    
                    <td style="color:<%=color%>"><%=d%></td>

                    <%
                    if(count == 7){
                        out.print("<tr></tr>");
                        count = 0;
                        }

                    }

                    while(count < 7) {
                        out.print("<td></td>");
                        count++; 
                    }
                    %>
                    </tr>
                </table>
                	</article>  
				</setion>
	        </main>        
    </div>
</body>
</html>
