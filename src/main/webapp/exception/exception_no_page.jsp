<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>페이지 오류</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../inc/menu.jsp"%>

<div class="jumbotron">
    <div class="container">
        <h2 class="alert alert-danger">
            요청하신 페이지를 찾을 수 없습니다.
        </h2>
    </div>
</div>
<div class="container">
    <div><%=request.getRequestURL()%></div>
    <div><a href="../main/welcome.jsp" class="btn btn-secondary">메인화면 가기 &raquo;</a></div>
    <hr>
</div>
<%@ include file="../inc/footer.jsp"%>
</body>
</html>
