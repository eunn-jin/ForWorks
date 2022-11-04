<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

     

      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['항목이름', '득표수'],
          //투표 항목들 
          ['항목1',     1],
          ['항목1',     2],
          ['항목1',     3],
          ['항목1',     4],
          ['항목1',     5],
          //투표 항목들 
          ['불참',    x-y]
        ]);

        var options = {
          title: '투표현황',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>


    <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
