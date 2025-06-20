<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.opentime.jsp_market_2506.DTO.Cart" %>
<%@ page import="com.opentime.jsp_market_2506.DTO.Product" %>
<%@ page import="com.opentime.jsp_market_2506.DAO.ProductRepository" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String orderId = "", orderName = "", tel = "",
            zipCode = "", address1 = "", address2 = "";

    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            String name = cookie.getName();
            switch (name) {
                case "orderId":
                    orderId = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8);
                    break;
                case "orderName":
                    orderName = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8);
                    break;
                case "tel":
                    tel = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8);
                    break;
                case "zipCode":
                    zipCode = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8);
                    break;
                case "address1":
                    address1 = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8);
                    break;
                case "address2":
                    address2 = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8);
                    break;
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주문 정보</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../inc/menu.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">주문 정보</h1>
    </div>
</div>
<div class="container col-8 alert alert-info">
    <div class="text-center">
        <h1>영수증</h1>
    </div>
    <div class="row justify-content-between">
        <div class="col-4" align="left">
            <strong>배송 주소</strong> <br>
            성명 : <%=orderName %> <br>
            우편번호 : <%=zipCode %> <br>
            주소 : <%=address1 %> <%=address2 %> <br>
            전화번호 : <%=tel %> <br>
        </div>
    </div>

    <div>
        <table class="table table-hover">
            <tr>
                <th class="text-center">상품</th>
                <th class="text-center">#</th>
                <th class="text-center">가격</th>
                <th class="text-center">소계</th>
            </tr>
            <%
                int sum = 0;
                List<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
                ProductRepository productRepository = ProductRepository.getInstance();
                for (Cart cart : carts) {
                    Product product = productRepository.getProductById(cart.getProductId());
                    int total = product.getUnitPrice() * cart.getCartCnt();
                    sum += total;
            %>
            <tr>
                <td class="text-center"><em><%=product.getProductName()%> </em></td>
                <td class="text-center"><%=cart.getCartCnt()%></td>
                <td class="text-center"><%=String.format("%,d",product.getUnitPrice())%>원</td>
                <td class="text-center"><%=String.format("%,d",total)%>원</td>
            </tr>
            <%
                }
            %>
            <tr>
                <td>&nbsp</td>
                <td>&nbsp</td>
                <td class="text-right">    <strong>총액:&nbsp</strong></td>
                <td class="text-center text-danger"><strong><%=String.format("%,d",sum)원%> </strong></td>
            </tr>
        </table>

        <a href="./shipping_info.jsp" class="btn btn-secondary" role="button"> 이전 </a>
        <a href="./thank_customer.jsp"  class="btn btn-success" role="button"> 주문 완료 </a>
    </div>

</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>