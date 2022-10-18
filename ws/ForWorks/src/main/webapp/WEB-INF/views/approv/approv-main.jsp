<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재메뉴</title>

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
        margin-bottom: 35px;
    }

    .approv-check-div{
        width: 100%;
        height: 270px;
        margin-bottom: 35px;
        background-color: white;
        border-radius: 20px;
        padding: 20px;
    }

    .approv-check-title{
        font-weight: 800;
        font-size: 20px;
        color: #6F5CFA;
        display: flex;
        justify-content: space-between;
    }

    .approv-check-title>a{
        font-size: 13px;
        text-decoration: none;
        color: #6F62FA;
    }

    .approv-check-content-wrap{
        display: flex;
        height: 85%;
    }

    .approv-check-content{
        width: 25%;
        height: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-around;
    }
    
    .approv-btn-wrap{
        display: flex;
        align-items: center;
    }
    

    .approv-btn{
       border: none;
       background-color: white;
       width: 40px;
       height: 40px;
       
    }

    .approv-btn>svg{
        fill: #7D6CFF;
        width: 40px;
        height: 40px;
    }

    .content-title{
        font-weight: 800;
        color: #7F7894;
    }

    .content-bot{
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .content-bot-font{
        font-weight: 800;
        color: #959D9C;
        margin-top: 5px;
        margin-bottom: 5px;
    }

    .div-bar{
        width: 1px;
        height: 100%;
        border: 0.5px solid #B7ADFC;
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

                <div id="main-header">결재문서</div>

                    <div class="approv-check-div">
                        <div class="approv-check-title">
                            결재대기문서
                            <a href="">목록 보기</a>
                        </div>
                        <div class="approv-check-content-wrap">
                            <div class="approv-btn-wrap">
                                <button class="approv-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
                                    <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
                                </svg></button>
                            </div> 
                            <div class="approv-check-content">
                                <div class="content-title">문서제목</div>
                                <div class="content-bot">
                                    <div class="content-date content-bot-font">기안일자</div>
                                    <div class="content-writer content-bot-font">기안자</div>
                                </div>
                            </div>
                            <div class="div-bar"></div>
                            <div class="approv-check-content">
                                <div class="content-title">문서제목</div>
                                <div class="content-bot">
                                    <div class="content-date content-bot-font">기안일자</div>
                                    <div class="content-writer content-bot-font">기안자</div>
                                </div>
                            </div>
                            <div class="div-bar"></div>
                            <div class="approv-check-content">
                                <div class="content-title">문서제목</div>
                                <div class="content-bot">
                                    <div class="content-date content-bot-font">기안일자</div>
                                    <div class="content-writer content-bot-font">기안자</div>
                                </div>
                            </div>
                            <div class="div-bar"></div>
                            <div class="approv-check-content">
                                <div class="content-title">문서제목</div>
                                <div class="content-bot">
                                    <div class="content-date content-bot-font">기안일자</div>
                                    <div class="content-writer content-bot-font">기안자</div>
                                </div>
                            </div>
                            <button class="approv-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle-fill" viewBox="0 0 16 16">
                                <path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
                            </svg></button>
                        </div> 
                    </div>
            </div>

                <div class="approv-check-div">
                    <div class="approv-check-title">
                        미확인 협조 문서
                        <a href="">목록 보기</a>
                    </div>
                    <div class="approv-check-content-wrap">
                        <div class="approv-btn-wrap">
                            <button class="approv-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
                                <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
                            </svg></button>
                        </div> 
                        <div class="approv-check-content">
                            <div class="content-title">문서제목</div>
                            <div class="content-bot">
                                <div class="content-date content-bot-font">기안일자</div>
                                <div class="content-writer content-bot-font">기안자</div>
                            </div>
                        </div>
                        <div class="div-bar"></div>
                        <div class="approv-check-content">
                            <div class="content-title">문서제목</div>
                            <div class="content-bot">
                                <div class="content-date content-bot-font">기안일자</div>
                                <div class="content-writer content-bot-font">기안자</div>
                            </div>
                        </div>
                        <div class="div-bar"></div>
                        <div class="approv-check-content">
                            <div class="content-title">문서제목</div>
                            <div class="content-bot">
                                <div class="content-date content-bot-font">기안일자</div>
                                <div class="content-writer content-bot-font">기안자</div>
                            </div>
                        </div>
                        <div class="div-bar"></div>
                        <div class="approv-check-content">
                            <div class="content-title">문서제목</div>
                            <div class="content-bot">
                                <div class="content-date content-bot-font">기안일자</div>
                                <div class="content-writer content-bot-font">기안자</div>
                            </div>
                        </div>
                        <div class="approv-btn-wrap">
                            <button class="approv-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle-fill" viewBox="0 0 16 16">
                                <path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
                              </svg></button>
                        </div> 
                    </div>
                </div>

                <div class="approv-check-div">
                    <div class="approv-check-title">
                        미확인 참조 문서
                        <a href="">목록 보기</a>
                    </div>
                    <div class="approv-check-content-wrap">
                        <div class="approv-btn-wrap">
                            <button class="approv-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
                                <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
                            </svg></button>
                        </div> 
                        <div class="approv-check-content">
                            <div class="content-title">문서제목</div>
                            <div class="content-bot">
                                <div class="content-date content-bot-font">기안일자</div>
                                <div class="content-writer content-bot-font">기안자</div>
                            </div>
                        </div>
                        <div class="div-bar"></div>
                        <div class="approv-check-content">
                            <div class="content-title">문서제목</div>
                            <div class="content-bot">
                                <div class="content-date content-bot-font">기안일자</div>
                                <div class="content-writer content-bot-font">기안자</div>
                            </div>
                        </div>
                        <div class="div-bar"></div>
                        <div class="approv-check-content">
                            <div class="content-title">문서제목</div>
                            <div class="content-bot">
                                <div class="content-date content-bot-font">기안일자</div>
                                <div class="content-writer content-bot-font">기안자</div>
                            </div>
                        </div>
                        <div class="div-bar"></div>
                        <div class="approv-check-content">
                            <div class="content-title">문서제목</div>
                            <div class="content-bot">
                                <div class="content-date content-bot-font">기안일자</div>
                                <div class="content-writer content-bot-font">기안자</div>
                            </div>
                        </div>
                        <div class="approv-btn-wrap">
                            <button class="approv-btn"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle-fill" viewBox="0 0 16 16">
                                <path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
                              </svg></button>
                        </div> 
                    </div>
                </div>

            </div>

        </main>        
    </div>

</body>
</html>