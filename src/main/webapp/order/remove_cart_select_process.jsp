<%@ page import="com.opentime.jsp_market_2506.DTO.Cart" %>
<%@ page import="java.util.*" %>
<%@ page import="com.opentime.jsp_market_2506.DTO.Product" %>
<%@ page import="com.opentime.jsp_market_2506.DAO.ProductRepository" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    <%
    session.removeAttribute("carts");
    response.sendRedirect("./cart.jsp");
    %>
</script>