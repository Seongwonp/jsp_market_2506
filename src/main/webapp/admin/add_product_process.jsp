<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.opentime.jsp_market_2506.DAO.ProductRepository" %>
<%@ page import="com.opentime.jsp_market_2506.DTO.Product" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../inc/dbconn.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");
     String productId = request.getParameter("productId"); // 상품 아이디
     String productName = request.getParameter("productName"); // 상품명
    int unitPrice = request.getParameter("unitPrice").isEmpty()? 0 : Integer.parseInt(request.getParameter("unitPrice")); // 상품 가격
    String description = request.getParameter("description"); // 상품 설명
     String manufacturer = request.getParameter("manufacturer"); // 제조사
     String category = request.getParameter("category"); // 분류
    int unitsInStock = Integer.parseInt(request.getParameter("unitsInStock")); // 재고수
     String condition = request.getParameter("condition"); // 신상품 or 중고 or 재생품


    PreparedStatement preparedStatement = null;
    String SQL = "INSERT INTO product(productId, productName, unitPrice, description, manufacturer, category, unitsInStock, `condition`) VALUES(?,?,?,?,?,?,?,?)";
    try{
        preparedStatement = connection.prepareStatement(SQL);
        preparedStatement.setString(1,productId);
        preparedStatement.setString(2,productName);
        preparedStatement.setInt(3,unitPrice);
        preparedStatement.setString(4,description);
        preparedStatement.setString(5,manufacturer);
        preparedStatement.setString(6,category);
        preparedStatement.setInt(7,unitsInStock);
        preparedStatement.setString(8,condition);
        preparedStatement.executeUpdate();

        if(preparedStatement != null) preparedStatement.close();
        if(connection != null) connection.close();

    } catch (SQLException e){
        throw new RuntimeException(e.getMessage());
    }
    response.sendRedirect("../product/product_list.jsp");
%>
<p><b>상품 코드: </b> <%=productId%></p>
<p><b>상 품 명 : </b> <%=productName%></p>
<p><b>상품 가격: </b> <%=unitPrice%>원</p>
<p><b>제 조 사: </b> <%=manufacturer%></p>
<p><b>분 류 : </b> <%=category%></p>
<p><b>제 고 수: </b> <%=unitsInStock%>개</p>
<p><b>제품 상태: </b> <%=condition%></p>
<p><b>상품 정보: </b> <%=description%></p>
