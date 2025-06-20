<%@ page import="java.sql.*" %>
<%@ page import="com.opentime.jsp_market_2506.DTO.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품편집</title>
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
<%@include file="../inc/dbconn.jsp"%>

<%
    String productId = request.getParameter("productId");
    if(productId == null || productId.trim().isEmpty()){
        response.sendRedirect("./edit_product.jsp");
    }
    
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    Product product = null;
    String SQL = "SELECT * FROM product WHERE productId = ?";
    try{
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
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <form name="frmAddProduct" action="./update_product_process.jsp?productId=<%=product.getProductId()%>" class="form-horizontal" method="post">
                <div class="form-group row">
                    <label for="productId" class="col-sm-2">상품 코드</label>
                    <div class="col-sm-4">
                        <p class="text-danger"><%=product.getProductId()%></p>
                    </div>
                </div>
                    <div class="form-group row">
                        <label for="productName" class="col-sm-2">상품 이름</label>
                        <div class="col-sm-7">
                            <input type="text" id="productName" name="productName" class="form-control" value="<%=product.getProductName()%>">
                        </div>
                    </div>
                <div class="form-group row">
                    <label for="unitPrice" class="col-sm-2">상품 가격</label>
                    <div class="col-sm-5">
                        <input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=product.getUnitPrice()%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="manufacturer" class="col-sm-2">제조사</label>
                    <div class="col-sm-5">
                        <input type="text" id="manufacturer" name="manufacturer" class="form-control" value="<%=product.getManufacturer()%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="category" class="col-sm-2">분류</label>
                    <div class="col-sm-5">
                        <select name="category" id="category">
                            <option value="Smart Phone" <%= product.getCategory().equals("Smart Phone") ? "selected" : "" %>>스마트폰</option>
                            <option value="Notebook" <%= product.getCategory().equals("Notebook") ? "selected" : "" %>>노트북</option>
                            <option value="Tablet" <%= product.getCategory().equals("Tablet") ? "selected" : "" %>>태블릿</option>
                            <option value="Accessory" <%= product.getCategory().equals("Accessory") ? "selected" : "" %>>액세서리</option>
                            <option value="Etc" <%= product.getCategory().equals("Etc") ? "selected" : "" %>>기타</option>
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="unitsInStock" class="col-sm-2">재고 수</label>
                    <div class="col-sm-3">
                        <input type="number" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=product.getUnitsInStock()%>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="condition" class="col-sm-2">제품 상태</label>
                    <div class="col-sm-5">
                        <input type="radio" name="condition" value="New" <%= product.getCondition().equals("New") ? "checked" : "" %>> 신상품
                        <input type="radio" name="condition" value="Old" <%= product.getCondition().equals("Old") ? "checked" : "" %>> 중고
                        <input type="radio" name="condition" value="Refurbished" <%= product.getCondition().equals("Refurbished") ? "checked" : "" %>> 재생품
                    </div>
                </div>
                <div class="form-group row">
                    <label for="description" class="col-sm-2">상품 정보</label>
                    <div class="col-sm-5">
                        <textarea type="text" id="description" name="description" class="form-control"><%=product.getDescription()%></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" value="수정" class="btn btn-primary">
                        <input type="button" value="초기화" class="btn btn-secondary">
                        <script>
                            document.querySelector("input[type=button]").addEventListener("click",function(e) {
                                e.preventDefault();
                                location.reload();
                            });
                        </script>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <hr>
</div>
<%@ include file="../inc/footer.jsp"%>
</body>
</html>
