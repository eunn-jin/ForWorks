<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양식</title>

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
        margin-right: 1.5px;
        margin-left: 1.5px;
    }

    .approv-title-wrap{
        display: flex;
        width: 800px;
    }

    .select-form-wrap{
        margin-right: 80px;
    }

    .approv-area{
        margin-bottom: 35px;
        background-color: white;
        border-radius: 20px;
        padding: 20px;
        border: 1px solid #7D6CFF;
    }

    .form-title-label{
        font-weight: 800;
        font-size: 26px;
        color: #6F5CFA;
        margin-right: 15px;
        height: 60px;
        display: flex;
        align-items: center;
    }

    .title-input{
        font-weight: 800;
        font-size: 26px;
        color: black;
        height: 60px;
        width: 86%;
    }

    .form-list{
        display: flex;
        flex-direction: column;
        width: 500px;
        margin-right: 15px;
        height: 600px;
    }

    .approv-list-btn{
        border: none;
        background-color: #7D6CFF;
        width: 100px;
        height: 50px;
        color: white;
        border-radius: 20px;
        font-size: 15px;
        font-weight: 800;
    }

    .form-list-item{
        display: flex;
        align-items: center;
    }

    .item-no{
        width: 10%;
    }

    .item-title{
        width: 70%;
    }

    .approv-main-wrap{
        display: flex;
    }

    .item-text{
        font-size: 30px;
        font-weight: 800;
    }

    .approv-page-btn{
        border: none;
        background-color: #7D6CFF;
        width: 50px;
        height: 50px;
        color: white;
        border-radius: 20px;
        font-size: 15px;
        font-weight: 800;
    }

    .page-area{
        display: flex;
        justify-content: center;
    }

    

</style>
        <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
        
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<link rel="stylesheet" href="${root}/resources/css/approv/common.css">

</head>
<body>

    <div id="wrap">


        <main>
            
            <div id="main-wrap">

                <div id="main-header">양식 목록</div>

                <div class="approv-main">

					<div class="approv-main-wrap">
					
                        <div class="approv-area form-list">
                            <div class="form-list-item">

                                <div class="item-no item-text">1</div>
                                
                                    
                                    <div class="item-title item-text"><a href="">9글자까지</a></div>
                                    

                                    <button class="approv-list-btn approv-btn-margin">
                                        <span class="approv-btn-text">미리보기</span>
                                    </button>

                            </div>
                            <div class="page-area">
								<button class="approv-page-btn approv-btn-margin">
                                    <span class="approv-btn-text">1</span>
                                </button>
                                <button class="approv-page-btn approv-btn-margin">
                                    <span class="approv-btn-text">2</span>
                                </button>
                                <button class="approv-page-btn approv-btn-margin">
                                    <span class="approv-btn-text">3</span>
                                </button>
                                <button class="approv-page-btn approv-btn-margin">
                                    <span class="approv-btn-text">4</span>
                                </button>
                                <button class="approv-page-btn approv-btn-margin">
                                    <span class="approv-btn-text">5</span>
                                </button>
                                <button class="approv-page-btn approv-btn-margin">
                                    <span class="approv-btn-text">6</span>
                                </button>
                                <button class="approv-page-btn approv-btn-margin">
                                    <span class="approv-btn-text">7</span>
                                </button>
                            </div>
                        </div>
					
                        
                        <div class="approv-detail-div">
                            
                        </div>
                            
                    </div>
                        
                    <div class="btn-area">
                        <button class="approv-btn">목록보기</button>
                        <div class="approv-btn-area">
                            <button class="approv-btn">
                                <span class="approv-btn-text">양식 생성</span>
                            </button>
                            <button class="approv-btn">
                                <span class="approv-btn-text">양식 삭제</span>
                            </button>
                        </div>
                    </div>
                
                </div>
            </div>

        </main>        
    </div>

</body>
</html>