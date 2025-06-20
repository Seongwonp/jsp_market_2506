<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../inc/dbconn.jsp" %>
<%
    String productId = request.getParameter("productId"); // 상품 아이디
    String productName = request.getParameter("productName"); // 상품명
    int unitPrice = request.getParameter("unitPrice").isEmpty() ? 0 : Integer.parseInt(request.getParameter("unitPrice")); // 상품 가격
    String description = request.getParameter("description"); // 상품 설명
    String manufacturer = request.getParameter("manufacturer"); // 제조사
    String category = request.getParameter("category"); // 분류
    int unitsInStock = Integer.parseInt(request.getParameter("unitsInStock")); // 재고수
    String condition = request.getParameter("condition"); // 신상품 or 중고 or 재생품

    PreparedStatement preparedStatement = null;
    String SQL = "UPDATE product SET productName= ?, unitPrice=?, description=?, manufacturer=?, category=?, unitsInStock=?, `condition`=? WHERE productId = ?";
    try {
        preparedStatement = connection.prepareStatement(SQL);
        preparedStatement.setString(1, productName);
        preparedStatement.setInt(2, unitPrice);
        preparedStatement.setString(3, description);
        preparedStatement.setString(4, manufacturer);
        preparedStatement.setString(5, category);
        preparedStatement.setInt(6, unitsInStock);
        preparedStatement.setString(7, condition);
        preparedStatement.setString(8, productId);
        if (preparedStatement.executeUpdate() > 0) {
%>
<script language="JavaScript">
    alert("업데이트 되었습니다!");
    location.href = "./edit_product.jsp";
</script>
<%
            if(preparedStatement != null) preparedStatement.close();
            if(connection != null) connection.close();
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>