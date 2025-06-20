<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.opentime.jsp_market_2506.DTO.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.opentime.jsp_market_2506.DAO.ProductRepository" %>
<%@ page import="java.sql.*" %>
<%@ page errorPage="../exception/exception_no_product.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상세정보</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../inc/menu.jsp"%>

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            상품 정보
        </h1>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <%@ include file="../inc/dbconn.jsp"%>
            <%
                DecimalFormat df = new DecimalFormat("#,##0");
                PreparedStatement preparedStatement = null;
                ResultSet resultSet = null;
                Product product = null;
                String productId = request.getParameter("productId"); //넘어온 아이디를 링크주소에서 뽑아옴
                String SQL = "SELECT * FROM product WHERE productId = ?";
                preparedStatement = connection.prepareStatement(SQL);
                preparedStatement.setString(1,productId);
                resultSet = preparedStatement.executeQuery();
                if(resultSet.next()){
                    product = Product.builder()
                            .productId(resultSet.getString("productId"))
                            .productName(resultSet.getString("productName"))
                            .unitPrice(resultSet.getInt("unitPrice"))
                            .description(resultSet.getString("description"))
                            .manufacturer(resultSet.getString("manufacturer"))
                            .category(resultSet.getString("category"))
                            .unitsInStock(resultSet.getInt("unitsInStock"))
                            .condition(resultSet.getString("condition"))
                            .build();
                }

            %>
                <h3><%=product.getProductName()%></h3>
                <p><%=product.getDescription()%></p>
                <ul class="list-group-item">
                    <li><b>상품코드 : </b><span class="badge badge-danger"> <%=product.getProductId()%></span></li>
                    <li><b>제조사 : </b> <%=product.getManufacturer()%></li>
                    <li><b>분류 : </b> <%=product.getCategory()%></li>
                    <li><b>재고 수 : </b> <span style="color: blue"><%=df.format(product.getUnitsInStock())%>개</span></li>
                    <li><b>가격 : </b> <%=df.format(product.getUnitPrice())%>원</li>
                </ul>
                    <br/>
                    <form name="frmAddCart" method="post" action="../order/add_cart_process.jsp">
                        <input type="hidden" name="productId" value="<%=productId%>">
                    </form>
                    <p>
                        <a href="#" class="btn btn-info" id="btnAddCart">장바구니 담기 &raquo;</a>
                        <a href="../order/cart.jsp" class="btn btn-secondary">장바구니 목록 &raquo;</a>
                    </p>

                    <p><a href="#" class="btn btn-info"> 상품 주문 &raquo;</a>
                        <a href="../product/product_list.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
                    </p>
        </div>
    </div>
    <%
        try{
            if(resultSet != null) resultSet.close();
            if(preparedStatement != null) preparedStatement.close();
            if(connection != null) connection.close();
        } catch (SQLException e){
            throw  new RuntimeException(e);
        }
    %>
    <hr>
</div>
<%@ include file="../inc/footer.jsp"%>
<script>
    const btnAddCart = document.getElementById("btnAddCart");
    const frmAddCart = document.querySelector("form[name=frmAddCart]");
    btnAddCart.addEventListener("click", (e) =>{
        e.preventDefault();
        frmAddCart.submit();
    });
</script>
</body>
</html>
