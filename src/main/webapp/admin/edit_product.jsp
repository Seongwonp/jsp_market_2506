<%@ page import="com.opentime.jsp_market_2506.DTO.Product" %>
<%@ page import="com.opentime.jsp_market_2506.DAO.ProductRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 편집</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../inc/menu.jsp"%>

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            상품 편집
        </h1>
    </div>
</div>
<div class="container">
    <div class="row text-center">
        <%@ include file="../inc/dbconn.jsp"%>
        <%
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
            List<Product> products = new ArrayList<>();
            String SQL = "SELECT * FROM product";
            try {
                preparedStatement = connection.prepareStatement(SQL);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                resultSet = preparedStatement.executeQuery();
                while(resultSet.next()){
                    Product product = Product.builder()
                            .productId(resultSet.getString("productId"))
                            .productName(resultSet.getString("productName"))
                            .unitPrice(resultSet.getInt("unitPrice"))
                            .description(resultSet.getString("description"))
                            .manufacturer(resultSet.getString("manufacturer"))
                            .category(resultSet.getString("category"))
                            .unitsInStock(resultSet.getInt("unitsInStock"))
                            .condition(resultSet.getString("condition"))
                            .build();
                    products.add(product);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            DecimalFormat df = new DecimalFormat("#,##0"); // #,##0원 형식으로 표시

            for(Product product : products){
                %>
            <div class="col-md-4">
                <h3><%=product.getProductName()%></h3>
                <p><%=product.getDescription()%></p>
                <p><%=df.format(product.getUnitPrice())%>원</p>
                <p>
                    <a href="modify_product.jsp?productId=<%=product.getProductId()%>"
                       class="btn btn-secondary" role="button">수정 >></a>
                    <a href="./delete_product.jsp?productId=<%=product.getProductId()%>"
                       class="btn btn-danger" role="button">삭제</a>
                </p>
            </div>
        <%
            }
            try{
                if(resultSet != null) resultSet.close();
                if(preparedStatement != null) preparedStatement.close();
                if(connection != null) connection.close();
            } catch (SQLException e){
                throw  new RuntimeException(e);
            }


        %>
    </div>
    <hr>
</div>
<%@ include file="../inc/footer.jsp"%>
</body>
</html>
