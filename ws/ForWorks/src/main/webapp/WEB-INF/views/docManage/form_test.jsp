<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:set var="root" value="${pageContext.request.contextPath}" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양식 상세</title>

<style>

    main{
        background-color: #EEF1FF;
        padding-left: 40px;
        padding-right: 100px;
        padding-top: 45px;
    }

    #main-wrap{
       width: 100%;
       font-family: 'Inter', sans-serif;
       display: flex;
       flex-direction: column;
    }

    #main-header{
        font-weight: 800;
        font-size: 30px;
        color: #6F5CFA;
        margin-bottom: 15px;
    }

    .approv-main{
        display: flex;
        flex-direction: column;
        width: 100%;
        align-items: center;
    }

    .approv-detail-div{
        width: 800px;
        height: 1000px;
        margin-bottom: 35px;
        background-color: white;
        border-radius: 20px;
        padding: 20px;
        border: 1px solid #7D6CFF;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .btn-area{
        display: flex;
        margin-bottom: 35px;
        justify-content: space-between;
        width: 800px;
    }

    .approv-btn-area{
        display: flex;
    }

    .approv-btn{
        border: none;
        background-color: #7D6CFF;
        width: 180px;
        height: 60px;
        color: white;
        border-radius: 20px;
        font-size: 26px;
        font-weight: 800;
    }

    .approv-btn-margin{
        margin-right: 10px;
    }

    .default-text{
        font-weight: 800;
    }

    .detail-title{
        height: 50px;
        margin-bottom: 10px;
        font-size: 30px;
    }

    .detail-approve{
        display: flex;
        justify-content: flex-end;
        width: 100%;
        height: 148px;
        margin-bottom: 15px;
    }

    .detail-content{
        height: 533px;
    }

    .detail-etc{
        height: 138px;
        font-size: 14px;
        display: grid;
        border-top: 1px solid black;
        grid-template-columns: repeat(2, 1fr);
        grid-template-rows: repeat(2, 0.5fr);
        width: 100%;
    }

    .detail-part, .detail-position{
        height: 69px;
        font-size: 27px;
    }

    .etc-item{
        font-size: 14px;
        height: 20px;
        padding-top: 27.5px;
    }

    .table-area{
        height: 125px;
        
    }

    .approv-table td{
        width: 85px;
        border: 1px solid black;
        text-align: center;
        font-size: 14px;
    }

    .sign-area{
        height: 76px;
    }

    .default-text{
        font-weight: 800;
    }

    .detail-title{
        height: 50px;
        margin-bottom: 10px;
        font-size: 30px;
    }

    .detail-approve{
        display: flex;
        justify-content: flex-end;
        width: 100%;
        height: 148px;
        margin-bottom: 15px;
    }

    .detail-content{
        height: 533px;
        width: 100%;
    }

    .detail-etc{
        height: 138px;
        font-size: 14px;
        display: grid;
        border-top: 1px solid black;
        grid-template-columns: repeat(2, 1fr);
        grid-template-rows: repeat(2, 0.5fr);
        width: 100%;
    }

    .detail-part, .detail-position{
        height: 69px;
        font-size: 27px;
    }

    .etc-item{
        font-size: 14px;
        height: 20px;
        padding-top: 27.5px;
    }

    .table-area{
        height: 125px;
        
    }

    .approv-table{
        display: grid;
        grid-template-columns: repeat(4, 85px); /*jstl로 유동적으로 늘림*/
        grid-template-rows: 24px 24px 76px 24px;
        
    }

    .approv-table div{
        border: 1px solid black;
        text-align: center;
        font-size: 14px;
    }

    .sign-area{
        height: 76px;
    }

    #approv-member{
        grid-column: 2/5; /*jstl로 유동적으로 늘림*/ 
    }

    #creater-sign{
        grid-row: 2/4;
    }
   
    #coop-member{
        grid-column: 2/5;  /*jstl로 유동적으로 늘림*/
    }


</style>

  
</head>
<body>

    <div id="app">
        
    
        <div id="main">
      
    
              
                   <section class="section">
                     
                  
                            
                            <div class="approv-detail-div">
                                <div class="detail-title default-text">${one[0].adocName}</div>
                                <div class="detail-approve default-text">
                                    <div class="approv-table">




                                        <div>기안자</div>
                                        <div id="approv-member">결재자</div>

                                        <div id="creater-sign">
                                            <c:forEach var="SignList" items="${sign}" begin="0" end="0">
                                            <img alt="" style="width: 100%; height: 100%;" src="${root}/resources/upload/sign/${mem.signEdit}">
                                            </c:forEach>
                                        </div> <!-- 사인넣기 -->
                                        <c:forEach var="s" items="${sign}">
                                            <div>${s.empName}</div>
                                        </c:forEach>
                                        <div class="sign-area"></div>
                                        <c:forEach var="SignList" items="${sign}" >
 
                                                <div class="sign-area"><img alt="" style="width: 100%; height: 100%;"src="${root}/resources/upload/sign/${SignList.signEdit}"></div>
                                            
                                        </c:forEach>
                                        

                                        <div >협조자</div>
                                        <div id="coop-member">
                                            <c:forEach var="coo" items="${coo}">
                                            ${coo.empName} &nbsp;
                                            </c:forEach>
                                        </div>    

                                            
                                    </div>
                                </div>
                                <div class="detail-content">
                                    ${one[0].adocContent}
                                </div>
                                <div class="detail-etc default-text">
                                    <div class="etc-item">문서번호 : ${one[0].adocNo}</div>
                                    <div class="etc-item">문서생성일자 : ${one[0].draftDate}</div>
                                </div>
                                <div class="detail-part default-text">처부 : ${mem.deptName}</div>
                                <div class="detail-position default-text">직위 : ${mem.posName}</div>
                            </div>
        
                       
                  
                   
                   </section>
               </div>
               
           </div>
    
    </div>

    </body>

</html>