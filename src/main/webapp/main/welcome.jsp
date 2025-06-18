<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>welcome</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<%@ include file="../inc/menu.jsp"%>

    <%!
        String greeting = "Welcome to Web Shopping Mall";
        String tagline = "Welcome to Web Market!";
    %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            <%=greeting%>
        </h1>
    </div>
</div>
<div class="container">
    <div class="text-center">
        <h3>
            <%=tagline%>
        </h3>
        <%
            response.setIntHeader("Refresh",60); // 페이지 새로고침 설정 ( 1분 후)
            Calendar calendar = Calendar.getInstance();
            int hour = calendar.get(Calendar.HOUR);
            int minute = calendar.get(Calendar.MINUTE);
            int second = calendar.get(Calendar.SECOND);

            String am_pm = calendar.get(Calendar.AM_PM) == Calendar.AM ? "AM" : "PM";

            if(hour == 0){
                hour = 12;
            }
            String currentTime = String.format("%02d:%02d:%02d %s",hour,minute,second,am_pm);
            out.println("현재 접속 시각: " + currentTime + '\n');
        %>
    </div>
    <hr>
</div>
<%@ include file="../inc/footer.jsp"%>
</body>
</html>
