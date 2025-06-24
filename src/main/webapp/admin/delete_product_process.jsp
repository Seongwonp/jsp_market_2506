<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String productId = request.getParameter("productId");
%>
<%@include file="../inc/dbconn.jsp" %>
<%
    String SQL = "DELETE FROM product WHERE productId = ?";
    try {
        PreparedStatement preparedStatement = connection.prepareStatement(SQL);
        preparedStatement.setString(1, productId);
        if (preparedStatement.executeUpdate() > 0) {
%>
<script language="JavaScript">
    alert("삭제 되었습니다!");
    location.href = "./edit_product.jsp"
</script>
<%
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>

