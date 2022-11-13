<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서명 저장</title>

<style>

    main{
        background-color: #EEF1FF;
        padding-left: 40px;
        padding-right: 100px;
        padding-top: 45px;
        display: flex;
        height: 100vh;
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
        align-items: center;
        
    }

    .file-area{
        display: flex;
        width: 800px;
        justify-content: space-between;
    }

    .file-label{
        font-weight: 800;
        font-size: 20px;
        color: #6F5CFA;
        margin-right: 15px;
        height: 60px;
        display: flex;
        align-items: center;
    }

    .approv-area{
        margin-bottom: 35px;
        background-color: white;
        border-radius: 20px;
        padding: 20px;
        border: 1px solid #7D6CFF;
    }

    .file-input{
        font-weight: 800;
        font-size: 15px;
        color: black;
        height: 150px;
        width: 79%;
    }

    .btn-area{
        display: flex;
        margin-bottom: 35px;
        justify-content: space-between;
        width: 800px;
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

    .sample-img{
        margin-bottom: 35px;
        border-radius: 20px;
        padding: 20px;
        border: 1px solid #7D6CFF;
        background-image: none; /* ajax로 선택한 파일 받기*/
        width: 800px;
        height: 1000px;
        background-color: white;
    }
    
    .title-area{
        display: flex;
        width: 800px;
        justify-content: space-between;
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
    
     .approv-area{
        margin-bottom: 35px;
        background-color: white;
        border-radius: 20px;
        padding: 20px;
        border: 1px solid #7D6CFF;
    }
    
     .title-input{
        font-weight: 800;
        font-size: 26px;
        color: black;
        height: 60px;
        width: 86%;
    }

</style>
    

        <%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
        
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<link rel="stylesheet" href="${root}/resources/css/approv/common.css">

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    
</head>
<body>
<form action="" method="post" enctype="multipart/form-data">
    <div id="wrap">



        <main>
            
            <div id="main-wrap">

                <div id="main-header">비전자문서</div>

                <div class="approv-main">
                
		                <div class="title-area">

                            <div class="title-label approv-area"><div>제목</div></div>

                            <input type="text" class="approv-area title-input" name="adocName" placeholder="제목을 입력해주세요">
                        </div>

                    <div class="file-area">

                        <div class="file-label approv-area"><div>문서 업로드</div></div>

                        <input type="file" class="approv-area file-input" name="docFile">
                    </div>

                    <img class="sample-img"></img>


                    <div class="btn-area">
                        <button type="button" class="approv-btn" onclick="location.href='${root}/approv/main'">뒤로가기</button>
                        <button class="approv-btn">저장하기</button>
                    </div>
                
                </div>
            </div>


            

        </main>        


    </div>
</form>

    <script>
    	
	    const docFile = document.querySelector('input[name="docFile"]');
	    docFile.onchange = function () {
	        const imgTag = document.querySelector('.sample-img');
	        if(docFile.files.length>0){
	            const fr = new FileReader();
	
	            fr.readAsDataURL(docFile.files[0]);
	
	            fr.onload = function(data){
	                imgTag.src = data.target.result;
	            }
	        }else{
	            imgTag.src = "";
	        }
	    }
	
    </script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>

</html>



