<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.opentime.jsp_market_2506.DAO.ProductRepository" %>
<%@ page import="com.opentime.jsp_market_2506.DTO.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-08");
     String productId = request.getParameter("productId"); // 상품 아이디
     String productName = request.getParameter("productName"); // 상품명
    int unitPrice = request.getParameter("unitPrice").isEmpty()? 0 : Integer.parseInt(request.getParameter("unitPrice")); // 상품 가격
    String description = request.getParameter("description"); // 상품 설명
     String manufacturer = request.getParameter("manufacturer"); // 제조사
     String category = request.getParameter("category"); // 분류
    int unitsInStock = Integer.parseInt(request.getParameter("unitsInStock")); // 재고수
     String condition = request.getParameter("condition"); // 신상품 or 중고 or 재생품
%>
<p><b>상품 코드: </b> <%=productId%></p>
<p><b>상 품 명 : </b> <%=productName%></p>
<p><b>상품 가격: </b> <%=unitPrice%>원</p>
<p><b>제 조 사: </b> <%=manufacturer%></p>
<p><b>분 류 : </b> <%=category%></p>
<p><b>제 고 수: </b> <%=unitsInStock%>개</p>
<p><b>제품 상태: </b> <%=condition%></p>
<p><b>상품 정보: </b> <%=description%></p>
<%
    Product newProduct = new Product();
    newProduct.setProductId(productId);
    newProduct.setProductName(productName);
    newProduct.setUnitPrice(unitPrice);
    newProduct.setDescription(description);
    newProduct.setManufacturer(manufacturer);
    newProduct.setCategory(category);
    newProduct.setUnitsInStock(unitsInStock);
    newProduct.setCondition(condition);

    ProductRepository  productRepository = ProductRepository.getInstance();
    productRepository.addProduct(newProduct);

    response.sendRedirect("../product/product_list.jsp");

%>
