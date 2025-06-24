<%@ page import="com.opentime.jsp_market_2506.DTO.Cart" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Cart> carts = (List<Cart>) session.getAttribute("carts");
    String[] productIds = request.getParameterValues("productId");


    if (carts != null && productIds != null) {
        for (String pid : productIds) {
            carts.removeIf(cart -> cart.getProductId().equals(pid));
        }
%>
    <script>
        alert("삭제되었습니다!");
        location.href = "<%=request.getContextPath()%>/order/cart.jsp";
    </script>
<%
    }


%>