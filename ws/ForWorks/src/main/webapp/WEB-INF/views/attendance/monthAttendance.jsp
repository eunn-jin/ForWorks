<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>월 근태 현황</title>
     <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
</head>

<style>
	
	.multi-card {
		display: flex;
	    flex-wrap: wrap;
		justify-content: space-around;
    }

  .fc-header-toolbar {
    padding-top: 1em;
    padding-left: 1em;
    padding-right: 1em;
  }

  .first-card {
    width: 80%;
  }

  .second-card {
    height: 250px;
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
					<div class="col-12 col-md-6 order-md-1 order-last mb-3">
						<p class="text-subtitle">근태관리</p>
						<h3>월 근태 현황</h3>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="multi-card">
					<div class="card first-card">
						<div class="card-body">
                <div id='calendar-container'>
                    <div id='calendar'></div>
                </div>
						</div>
					</div>
					<div class="card second-card">
						<div class="card-body flex-col">
							<div>10월</div>
                  <div class="text-part">
                      <span>출근 횟수 : &ensp;</span>
                      <span> 3 </span>
                  </div>
                  <div class="text-part">
                      <span>지각 횟수 : &ensp;</span>
                      <span> 1 </span>
                  </div>
                  <div class="text-part">
                      <span>조퇴 횟수 : &ensp;</span>
                      <span> 0 </span>
                  </div>
                  <div class="text-part">
                      <span>휴가 사용 : &ensp;</span>
                      <span> 1 </span>
                  </div>
						</div>
					</div>
				</div>

			</section>
		</div>
		
    </div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</body>
<script>
	
	$().ready(function() {
		$('#att-month').addClass("active");
		$('#att-part').css("display", "block");
	});
	
</script>
<script>
    (function(){
      $(function(){
        // calendar element 취득
        var calendarEl = $('#calendar')[0];
        // full-calendar 생성하기
        var calendar = new FullCalendar.Calendar(calendarEl, {
          height: '700px', // calendar 높이 설정
          expandRows: true, // 화면에 맞게 높이 재설정
          // 해더에 표시할 툴바
          headerToolbar: {
            left: 'prev,next',
            center: 'title',
            right: 'today'
          },
          initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
          navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
          editable: false, // 수정 가능?
          selectable: false, // 달력 일자 드래그 설정가능
          nowIndicator: true, // 현재 시간 마크
          dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
          locale: 'ko', // 한국어 설정
          eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
            console.log(obj);
          },
          eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
            console.log(obj);
          },
          eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
            console.log(obj);
          },
          // 이벤트 
            events: [
            {
              groupId: 999,
              title: 'Repeating Event',
              start: '2021-07-09T16:00:00'
            },
            {
              groupId: 999,
              title: 'Repeating Event',
              start: '2021-07-16T16:00:00'
            },
            {
              title: 'Conference',
              start: '2021-07-11',
              end: '2021-07-13'
            },
            {
              title: 'Lunch',
              start: '2021-07-12T12:00:00'
            },
            {
              title: 'Meeting',
              start: '2021-07-12T14:30:00'
            }
          ]
        });
        // 캘린더 랜더링
        calendar.render();
      });
    })();
  </script>
<link rel="stylesheet" href="${root}/resources/css/attendance.css">
</html>