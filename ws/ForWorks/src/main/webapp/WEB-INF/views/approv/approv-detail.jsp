<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제-상세</title>

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

</style>

</head>
<body>

    <div id="wrap">

        <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
        
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<link rel="stylesheet" href="${root}/resources/css/approv/common.css">

        <main>
            
            <div id="main-wrap">

                <div id="main-header">결재상세</div>

                <div class="approv-main">

                    <div class="approv-detail-div">
                        <div class="detail-title default-text">제목</div>
                        <div class="detail-approve default-text">
                            <table class="approv-table">
                                <tr>
                                    <td>기안자</td>
                                    <td colspan="3" style="">결제자</td>
                                </tr>
                                <tr>
                                    <td rowspan="2"></td>
                                    <td>직위</td>
                                    <td>직위</td>
                                    <td>직위</td>
                                </tr>
                                <tr>
                                    <!-- <td></td> -->
                                    <td class="sign-area"></td>
                                    <td class="sign-area"></td>
                                    <td class="sign-area"></td>
                                </tr>
                                <tr>
                                    <td>협조자</td>
                                    <td colspan="3"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="detail-content default-text">내용</div>
                        <div class="detail-etc default-text">
                            <div class="etc-item">내용</div>
                            <div class="etc-item">내용</div>
                            <div class="etc-item">내용</div>
                            <div class="etc-item">내용</div>
                        </div>
                        <div class="detail-part default-text">처부</div>
                        <div class="detail-position default-text">직위</div>
                    </div>

                    <div class="btn-area">
                        <button class="approv-btn">목록보기</button>
                        <div class="approv-btn-area">
                            <button class="approv-btn approv-btn-margin">
                                <span class="approv-btn-text">결재</span>
                            </button>
                            <button class="approv-btn">
                                <span class="approv-btn-text">반려</span>
                            </button>
                        </div>
                    </div>
                
                </div>
            </div>

        </main>        
    </div>

</body>
</html>