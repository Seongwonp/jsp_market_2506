<%@ page import="com.opentime.jsp_market_2506.DTO.Cart" %>
<%@ page import="java.util.*" %>
<%@ page import="com.opentime.jsp_market_2506.DTO.Product" %>
<%@ page import="com.opentime.jsp_market_2506.DAO.ProductRepository" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%
    String productId = request.getParameter("productId");

    if(productId == null ||  productId.trim().isEmpty()){
        response.sendRedirect("../product/product_list.jsp");
        return;
    }
    ProductRepository productRepository = ProductRepository.getInstance();
    Product product = productRepository.getProductById(productId);
    if(product == null){
        response.sendRedirect("../exception/exception_no_product.jsp");
        return;
    }

    List<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
    for(Cart cart : carts){
        if(cart.getProductId().equals(productId)){
            carts.remove(cart);
            break;
        }
    }

    response.sendRedirect("./cart.jsp");
    %>
