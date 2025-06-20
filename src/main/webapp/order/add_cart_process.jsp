<%@ page import="com.opentime.jsp_market_2506.DTO.Product" %>
<%@ page import="com.opentime.jsp_market_2506.DAO.ProductRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="com.opentime.jsp_market_2506.DTO.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 2. 저장소에 저장
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
    if(carts == null){
        carts = new ArrayList<>();
        session.setAttribute("carts", carts);
    }
    boolean isList = false;
    for(Cart cart : carts){
        if(cart.getProductId().equals(productId)){
            isList = true;
            cart.setCartCnt(cart.getCartCnt() + 1);
            break;
        }
    }
    if(!isList){
        carts.add(new Cart(productId, 1));
    }
    response.sendRedirect("../product/product.jsp?productId=" + productId);
%>
