<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<div>${monthCnt.month}</div>
                  <div class="text-part">
                      <span>출근 횟수 : &ensp;</span>
                      <span> ${monthCnt.workCount} </span>
                  </div>
                  <div class="text-part">
                      <span>지각 횟수 : &ensp;</span>
                      <span> ${monthCnt.lateCount} </span>
                  </div>
                  <div class="text-part">
                      <span>조퇴 횟수 : &ensp;</span>
                      <span> ${monthCnt.earlyoutCount} </span>
                  </div>
                  <div class="text-part">
                      <span>휴가 사용 : &ensp;</span>
                      <span> ${monthCnt.offCount} </span>
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

	/* $('#calendar').fullCalendar({
		header: {
			right: 'today, customPrevButton, customNextButton',
			left: 'title'
		},
		customPrevButton: {
			text: '<',
			click: function(){
				
			}
		},
		customNextButton: {
			text: 'next',
			click: function(){
				var date = $("#calendar").fullCalendar("getDate");
				console.log(date);
			}
		}
		
	}); */


  $(function(){
     var calendarEl = $('#calendar')[0];
     var calendar = new FullCalendar.Calendar(calendarEl, {
       height: '700px',
       expandRows: true,
       headerToolbar: {
         left: 'today',
         center: 'title',
         right: 'prev,next'
       },
       initialView: 'dayGridMonth',
       navLinks: false,
       editable: false,
       selectable: false,
       nowIndicator: true,
       dayMaxEvents: true,
       locale: 'ko',
       eventClick: function(obj) {
         console.log(obj.event._instance.range.start);
         console.log(obj.event._instance.range.end);
       },
       events : [
 	   	{
            groupId: 999,
            title: 'Repeating Event',
            start: '2022-10-16T16:00:00'
          },
          {
            title: '정상 근무',
            start: '2022-10-26'
          },
         {
         	title: '지각',
         	start: '2022-10-25T10:00:00',
         	end: '2022-10-25T18:00:00',
         	descrption: 'test'
         },
         {
         	title: '출근',
         	start: '2022-10-26T09:30:00'
         },
         {
         	title: '퇴근',
         	start: '2022-10-26T10:05:00'
         }
       ]
     });
     // 캘린더 랜더링
     calendar.render();
   });
  </script>
  <script>
  	/* $.ajax({
  		url: '${root}/att/month',
  		type: 'POST',
  		data: {'month' : '2022-10'},
  		success: function(res){
  			var list = res;
  			console.log(list);
  			
  			var calendarEl = document.getElementById('calendar');
  			
  			var events = list.map(function(item){
  				return {
  					title : item.statusName,
  					start : item.workDate + "T" + item.inTime
  				}
  			});
  			
  			var calendar = new FullCalendar.Calendar(calendarEl, {
  				events: events,
  				eventTimeFormat: {
  					hour: '2-digit',
  					minute: '2-digit',
  					hour12: false
  				}
  			});
  			calendar.render();
  		}
  	});
  	
  	$('.fc-prev-button:button').click(function() {
  		console.log("btn 클릭..!");        
		var date = $("#calendar").fullCalendar("getDate");
		});       
				 
	$('.fc-next-button:button').click(function() {
		var date = $("#calendar").fullCalendar("getDate");
		console.log(date);
		console.log("test");
	});
  	      
		/* // 받은 날짜값을 date 형태로 형변환 해주어야 한다.    
		function convertDate(date) {
			        var date = new Date(date);
			        alert(date.yyyymmdd());
			    }
		
		Date.prototype.yyyymmdd = function() {        
			var yyyy = this.getFullYear().toString();        
			var mm = (this.getMonth() + 1).toString();        
			var dd = this.getDate().toString();        
			return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
		} */
  </script>
<link rel="stylesheet" href="${root}/resources/css/attendance.css">
</html>