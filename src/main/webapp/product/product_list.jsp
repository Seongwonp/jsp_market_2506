<%@ page import="com.opentime.jsp_market_2506.DTO.Product" %>
<%@ page import="com.opentime.jsp_market_2506.DAO.ProductRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 목록</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../inc/menu.jsp"%>

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            상품 목록
        </h1>
    </div>
</div>
<div class="container">
    <div class="row text-center">
        <%
            ProductRepository productRepository = ProductRepository.getInstance();
            DecimalFormat df = new DecimalFormat("#,##0"); // #,##0원 형식으로 표시
            List<Product> products = productRepository.getProducts();
            for(Product product : products){
                %>
            <div class="col-md-4">
                <h3><%=product.getProductName()%></h3>
                <p><%=product.getDescription()%></p>
                <p><%=df.format(product.getUnitPrice())%>원</p>
                <p>
                    <a href="./product.jsp?productId=<%=product.getProductId()%>"
                       class="btn btn-secondary" role="button">상세정보 >></a>
                </p>
            </div>
        <%
            }
        %>
    </div>
    <hr>
</div>
<%@ include file="../inc/footer.jsp"%>
</body>
</html>
