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
                             <div id='calendar'></div>
                             <script>
                             document.addEventListener('DOMContentLoaded', function() {
                            		var calendarEl = document.getElementById('calendar');
                            		var calendar = new FullCalendar.Calendar(calendarEl, {
                            			//날짜 클릭 시, 팝업창 화면 출력
                            			dateClick: function() {
                            				var url = "planPop";
                                    		var name = "일정 추가";
                                    		var option = "width = 867, height = 489";
                                    		window.open(url,name,option)
                            			},
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
                            			locale: 'ko' // 한국어 설정
                            		});
                            		calendar.render();
                            	});
                             </script>  
                    </div>
                </div>
          
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>




