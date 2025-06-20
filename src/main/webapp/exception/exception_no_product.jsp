<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 아이디 오류</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../inc/menu.jsp"%>

<div class="jumbotron">
    <div class="container">
        <h2 class="alert alert-danger">
            해당 상품이 존재하지 않습니다.
        </h2>
    </div>
</div>
<div class="container">
    <div><%=request.getRequestURL()%></div>
    <div><a href="../product/product_list.jsp" class="btn btn-secondary">상품 목록 &raquo;</a></div>
    <hr>
</div>
<%@ include file="../inc/footer.jsp"%>
</body>
</html>
