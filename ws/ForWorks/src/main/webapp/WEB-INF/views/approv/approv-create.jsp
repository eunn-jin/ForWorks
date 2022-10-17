<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 작성</title>

<style>

    main{
        background-color: #EEF1FF;
        padding-left: 40px;
        padding-right: 100px;
        padding-top: 45px;
        display: flex;
    }

    #main-wrap{
       width: 875px;
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
        
    }

    .approv-create-div{
        width: 800px;
        height: 500px;
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

    .title-area{
        display: flex;
        width: 800px;
        justify-content: space-between;
    }

    .approv-area{
        margin-bottom: 35px;
        background-color: white;
        border-radius: 20px;
        padding: 20px;
        border: 1px solid #7D6CFF;
    }

    .title-label{
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

    .file-area{
        display: flex;
        width: 800px;
        justify-content: space-between;
    }

    .file-label{
        font-weight: 800;
        font-size: 26px;
        color: #6F5CFA;
        margin-right: 15px;
        height: 60px;
        display: flex;
        align-items: center;
    }

    .file-input{
        font-weight: 800;
        font-size: 15px;
        color: black;
        height: 150px;
        width: 79%;
    }

    #add-member{
        display: flex;
        flex-direction: column;
    }

    .member-label{
        font-weight: 800;
        font-size: 23px;
        color: #6F5CFA;
        margin-right: 15px;
        height: 60px;
        display: flex;
        align-items: center;
    }

    .member-input{
        font-weight: 800;
        font-size: 23px;
        color: black;
        height: 60px;
        width: 340px;
        margin-bottom: 4px;
    }

    .member-input-area{
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .member-btn{
       border: none;
       background-color: transparent;
       width: 60px;
       height: 60px;
       
    }

    .member-btn>svg{
        fill: #7D6CFF;
        width: 60px;
        height: 60px;
        background-color: white;
    }

    .approv-member-area{
        display: flex;
        margin-bottom: 15px;
    }

    .margin-top{
        height: 150px;
    }

    .member-area-horizon{
        display: flex;
        justify-content: center;
    }

    .div-bar{
        width: 100%;
        height: 1px;
        border: 0.5px solid #B7ADFC;
        margin-top: 10px;
        margin-bottom: 25px;
    }

    

</style>

</head>
<body>

    <div id="wrap">

        <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
        

		<link rel="stylesheet" href="${root}/resources/css/approv/common.css">

        <main>
            
            <div id="main-wrap">

                <div id="main-header">문서 작성</div>

                <div class="approv-main">

                    <div class="title-area">

                        <div class="title-label approv-area"><div>제목</div></div>

                        <input type="text" class="approv-area title-input" placeholder="제목을 입력해주세요">
                    </div>

                    <div class="approv-create-div">


                    </div>

                    <div class="file-area">

                        <div class="file-label approv-area"><div>첨부파일</div></div>

                        <input type="file" class="approv-area file-input" placeholder="제목을 입력해주세요">
                    </div>


                    <div class="btn-area">
                        <button class="approv-btn">뒤로가기</button>
                    </div>
                
                </div>
            </div>


            <div id="add-member">
                <div class="margin-top"></div>
                <div class="approv-member-area">

                    <div class="member-label approv-area"><div>결제자 추가</div></div>

                    <div class="member-input-area">

                        <div class="member-area-horizon">

                            <input list="" class="approv-area member-input">
                                <datalist>

                                </datalist>
                            </input>

                            <button class="member-btn">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-square" viewBox="0 0 16 16">
                                    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                    <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                  </svg>
                            </button>

                        </div>

                        <button class="member-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                            </svg>
                        </button>

                    </div>

                </div>

                <div class="div-bar"></div>

                <div class="approv-member-area">

                    <div class="member-label approv-area"><div>협조자 추가</div></div>

                    <div class="member-input-area">

                        <div class="member-area-horizon">

                            <input list="" class="approv-area member-input">
                                <datalist>

                                </datalist>
                            </input>

                            <button class="member-btn">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-square" viewBox="0 0 16 16">
                                    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                    <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                  </svg>
                            </button>

                        </div>

                        <button class="member-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                            </svg>
                        </button>

                    </div>

                </div>

                <div class="div-bar"></div>

                <div class="approv-member-area">

                    <div class="member-label approv-area"><div>결재자 추가</div></div>

                    <div class="member-input-area">

                        <div class="member-area-horizon">

                            <input list="" class="approv-area member-input">
                                <datalist>

                                </datalist>
                            </input>

                            <button class="member-btn">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-square" viewBox="0 0 16 16">
                                    <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                    <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                  </svg>
                            </button>

                        </div>

                        <button class="member-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                            </svg>
                        </button>

                    </div>

                </div>
            </div>

        </main>        


    </div>

</body>
</html>