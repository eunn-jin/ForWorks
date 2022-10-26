<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<style>
 	#wrap{
        width: 60vw;
        height: 60vh;
    }
    #center{
        width: 60vw;
        height: 60vh;
        border: 1px solid black;/*확인용*/
        display: grid;
        grid-template-columns: 2fr 4fr 4fr 4fr ;
        grid-template-rows: repeat(0,4fr);
        text-align: center;
        background-color: white;
        overflow: scroll;
    }
    
    .div-top{
        font-size: larger;
        color: black;
        font-weight: bolder;
        border-bottom: 1px solid #7D6CFF;
    }
    #page-area{
        width: 30%;
        margin: 0 auto;
        display: flex;
        justify-content: space-around;
    }
    #search-area{
        margin: 0 auto;
        display: flex;
        justify-content: space-around;
    }
    #check-date{
        display: inline-block;
        background-color:white;
        height: 30px;
        font-size: large;
        color: #7D6CFF;
        font-weight: bolder;
    }
    #check-btn{
        position: relative;
        float: right;
        height: 30px;
    }
    #check-btn>button{
        cursor: pointer;
        height: 100%;
        font-size: large;
        background-color: white;
        border: none;
        color: #7D6CFF;
        font-weight: bolder;
    }

    /*모달 css*/
    .modal{
        position:absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        background-color: rgba(0,0,0,0.4);
    }

    .modal .show{
        display: block;
    }

    .modal_body{
        position: absolute;
        top: 50%;
        left: 50%;
        width: 400px;
        height: 600px;
        padding: 40px;
        text-align: left;
        background-color: rgb(255,255,255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34,36,38,0.15);

        transform: translateX(-50%) translateY(-50%);
    }


</style>
<body>

<div id="app">

	<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>

	<div id="main">
           <%@ include file="/WEB-INF/views/common/header.jsp" %>

           <div class="page-heading">
               <div class="page-title">
                   <div class="row">
                       <div class="col-12 col-md-6 order-md-1 order-last">
                           <h3>Layout Default</h3>
                           <p class="text-subtitle text-muted">The default layout </p>
                       </div>
                       <div class="col-12 col-md-6 order-md-2 order-first">
                           <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                               <ol class="breadcrumb">
                                   <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                   <li class="breadcrumb-item active" aria-current="page">Layout Default</li>
                               </ol>
                           </nav>
                       </div>
                   </div>
               </div>
               <section class="section">
				<div id="wrap">

				        <div id="check-date">
				            
				                상여금 목록 
				                <select name="year" id="year" title="년도" >
				                    
				                </select> 
				            
				        </div>

				        <div id="check-btn">
				            <button class="btn-open-popup">상여금 추가</button>
				        </div>
				        <div id="center">
				            <div class="div-top">번호</div>
				            <div class="div-top">상여제목</div>
                            <div class="div-top">상여 내용</div>
                            <div class="div-top">발생월</div>
                            
                                <c:forEach items="${bonusList}" var="b">
                                    <div class="bonus-no">${b.no}</div>
                                    <div class="bonus-title"><a href="${root}/bonus/memList/${b.no}">${b.title}</a></div>
                                    <div class="bonus-contet">${b.content}</div>
                                    <div class="bonus-date">${b.bdate}</div>
                                </c:forEach>
                  
                                
				        
				        </div>
				        
				        <div style="height: 100px;"></div>
				        
				    </div>
				
				<!--상여금 등록 버튼 클릭 시 모달창-->
				        
				<div class="modal">
                    <div class="modal_body">
                        <div><h1>상여금 등록</h1></div>
                        상여제목
                        <input type="text" id="bt" > <br>
                        발생월
                        <input type="date" id="date" value="2022-02-02"> <br>
                        상여내용
                        <textarea name="" id="content" cols="30" rows="10"></textarea>
                        <input type="button" onclick="addBonus()" value="등록">
                        
                        <div><button class="modal_close">close</button></div>
                    </div>
                </div>
                


                <!--모달 js-->
                <script>
                    const modal = document.querySelector('.modal');
                    const btnOpenPopup = document.querySelector('.btn-open-popup');

                    btnOpenPopup.addEventListener('click',()=>{
                        modal.style.display = 'block';
                    })
                    
                    const close = document.querySelector('.modal_close');
                    close.addEventListener('click',()=>{
                        modal.style.display = 'none';
                    })
                </script>

               </section>
           </div>
           
       </div>

</div>
<!--현재날짜 기본설정-->
<script>
    document.getElementById("date").valueAsDate = new Date();
</script>
<!--상여금 등록 ajax-->
<script>
   
    function addBonus(){
        var bt = $('#bt').val();
        var date = document.getElementById("date").value;
        var content = document.getElementById("content").value;
        $.ajax({
            url : "/ForWorks/bonus/add",
            type: "POST",
            data : {
                title : bt,
                bdate : date,
                content : content
            },
            success : function(data){
                if(data == 1){
                    alert("등록되었습니다");
                    modal.style.display="none";
                    location.reload();
                }else{
                    alert("다시 시도해주세요");
                }
            },
            error : function(){
                alert("통신실패")
            }
            
        })
    }
</script>
<!--SELECTBOX 연도 설정-->
<script>
    $(document).ready(function(){
        var now = new Date();
        var year = "";
        var com_year = now.getFullYear();
        console.log("com_year" + com_year);
        $("#year").append("<option value=''>연도</option>");
        for(var i = (com_year); i >= 2000 ; i--){
            $("#year").append("<option value='"+i+"'>"+i+"년"+"</option>");
        }
    })

</script>


<!--연도 별 상여금 조회 ajax-->
<script>

    $("select[name=year]").change(function(){
        var year = $(this).val();
        console.log(year);
        $.ajax({
            url : "/ForWorks/bonus/yearList",
            type : "POST",
            data : {year : year},
            success : function(data){
                $('#center').empty();
                console.log(data);
                $('#center').append(
                    '<div class="div-top">번호</div><div class="div-top">제목</div><div class="div-top">내용</div><div class="div-top">발생월</div>'
                )
                for(var i = 0 ; i < data.length ; i++){
                    $('#center').append(
                        '<div class="bonus-no">'+data[i].no+'</div><div class="div-title"><a href="${root}/bonus/memList">'+data[i].title+'</a></div><div class="div-content">'+data[i].content+'</div><div class="div-date">'+data[i].bdate+'</div>'
                        );
                }
                
            }
            ,error : function(){
                alert("다시 시도해주세요");
            }
            
        })
    })

</script>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script>
	
	$().ready(function() {
		console.log("test:");
		$('#ex1').addClass("active");
	});
	
</script>
</html>
