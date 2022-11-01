<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>일정 캘린더</title>
	<style>
	<input type='button' class='add-button' name='add-button' value='버튼' style="float: right;">
	</style>
</head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<body>

<div id="app">
	<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
	<div id="main">
        <%@ include file="/WEB-INF/views/common/header.jsp" %>

                            <h3>일정</h3>
                            <button class = "add-button" type = "button" onclick="click_add();">일정 추가</button>
                             <div id='calendar'></div>
                             <script>
                             document.addEventListener('DOMContentLoaded', function() {
                                var calendarEl = document.getElementById('calendar');
                                var calendar = new FullCalendar.Calendar(calendarEl, {
                                    initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
                                    headerToolbar : { // 헤더에 표시할 툴 바
                                        start : 'prev next today',
                                        center : 'title',
                                        end : 'dayGridMonth,dayGridWeek,dayGridDay'
                                    },
                                    titleFormat : function(date) {
                                        return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
                                    },
                                    //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
                                    selectable : true, // 달력 일자 드래그 설정가능
                                    droppable : true,
                                    editable : true,
                                    nowIndicator: true, // 현재 시간 마크
                                    eventAdd : function(obj) {
                                    	console.log('add')
                                    }
                                    locale: 'ko' // 한국어 설정
                                    
                                    	function createClnd(cal,xobj){ 
                                    	  if(!confirm("일정을 등록 하시겠습니까?")) return false; 
                                    	  var $obj = calFunc.getFormValue();    
                                    	  
                                    	  $.ajax({ 
                                    	      url: ctx+"/adms/calendar/management/create_ajx.do", 
                                    	      type: "POST", 
                                    	      contentType: "application/json;charset=UTF-8",
                                    	      data:JSON.stringify($obj) 
                                    	 }).done(function(data) { 
                                    	      var result = jQuery.parseJSON(data); 
                                    	      //모든 소스에서 이벤트를 다시 가져와 화면에 다시 렌더링
                                    	      cal.refetchEvents();
                                    	 }).fail(function(e) {  
                                    	     alert("실패하였습니다."+e);
                                    	 }).always(function() { 
                                    	     $("#name").val("");
                                    	     $("#comment").val("");
                                    	 }); 
                                    	  
                                    	}
                                });
                                calendar.render();
                            });
                           </script>  
                    </div>
                </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script>
	
	$().ready(function() {
		console.log("test:");
		$('#ex1').addClass("active");
	});
	
</script>
</html>



