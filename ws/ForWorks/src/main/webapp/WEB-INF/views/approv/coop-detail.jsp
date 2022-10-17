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

    

</style>

</head>
<body>

    <div id="wrap">

        <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
        

		<link rel="stylesheet" href="${root}/resources/css/approv/common.css">

        <main>
            
            <div id="main-wrap">

                <div id="main-header">협조상세</div>

                <div class="approv-main">

                    <div class="approv-detail-div">


                    </div>

                    <div class="btn-area">
                        <button class="approv-btn">목록보기</button>
                    </div>
                
                </div>
            </div>

        </main>        
    </div>

</body>
</html>