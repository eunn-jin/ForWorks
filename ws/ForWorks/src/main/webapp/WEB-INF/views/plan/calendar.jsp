<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>罹�由곕��</title>
<style>
    * {
        margin: 0;
        padding: 0;
        letter-spacing: -1px;
        box-sizing: border-box;
    }

    a {
        color: initial;
        text-decoration: none;
    }

    .flex {display: flex;}
    .col-flex {display: flex;flex-direction: column;}
    .jcc {justify-content: center;}
    .jcsb {justify-content: space-between;}
    .aic {align-items: center;}

    body {
        background: #E0EBFF;
    }

    .calendar {
        display: grid;
        grid-template-columns: repeat(7, 1fr);
        gap: 20px;
        padding: 40px;
    }

    .calendar > div {
        border-radius: 2px;
    }

    .calendar-top {
        padding: 20px;
        font-weight: 900;
    }

</style>
</head>

<body>
    <div class="wrap flex jcc aic">
        <div class="calendar">
            <div class="calendar-top">SUN</div>
            <div class="calendar-top">MON</div>
            <div class="calendar-top">TUE</div>
            <div class="calendar-top">WED</div>
            <div class="calendar-top">THR</div>
            <div class="calendar-top">FRI</div>
            <div class="calendar-top">SAT</div>
        </div>












    </div>


</body>
</html>