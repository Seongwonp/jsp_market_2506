<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /* 실제 작업은 페이지 상단이나, 이전 페이지에서 데이터베이스에 저장이 되어야 함.
     * 데이터베이스 저장에 성공한 후 완료 페이지가 출력이 되어야 함.
     * 작업이 마무리 되었으니 1) 세션의 장바구니 삭제 및 2) 쿠키의 주문 정보를 삭제 해야 함.
     */
    // 세션의 장바구니 속성 제거
    session.removeAttribute("carts");

    // 쿠키 배열 가져오기
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            String cookieName = cookie.getName();
            switch (cookieName) {
                case "orderId":
                case "orderName":
                case "tel":
                case "zipCode":
                case "address01":
                case "address02":
                    cookie.setMaxAge(0); // 쿠키 삭제
                    response.addCookie(cookie); // 응답에 쿠키 추가
                    break;
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주문 완료</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../inc/menu.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">주문 완료</h1>
    </div>
</div>
<div class="container">
    <div class="container">
        <h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
        <p>    주문번호 : <%=session.getAttribute("orderId")%></p>
    </div>
    <div class="container">
        <p>    <a href="../product/product_list.jsp" class="btn btn-secondary"> &laquo; 상품 목록</a>
    </div>
    <hr>
</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>