<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    // 한글이 깨지는 걸 방지하기 위해 URLEncoder.encode() 사용
    Cookie orderId = new Cookie("orderId", URLEncoder.encode(request.getParameter("orderId"), StandardCharsets.UTF_8));
    Cookie orderName = new Cookie("orderName", URLEncoder.encode(request.getParameter("orderName"), StandardCharsets.UTF_8));
    Cookie tel = new Cookie("tel", URLEncoder.encode(request.getParameter("tel"), StandardCharsets.UTF_8));
    Cookie zipCode = new Cookie("zipCode", URLEncoder.encode(request.getParameter("zipCode"), StandardCharsets.UTF_8));
    Cookie address1 = new Cookie("address1",   URLEncoder.encode(request.getParameter("address1"), StandardCharsets.UTF_8));
    Cookie address2 = new Cookie("address2",   URLEncoder.encode(request.getParameter("address2"), StandardCharsets.UTF_8));

    // 쿠키의 유효기간은 24시간으로 설정
    orderId.setMaxAge(24 * 60 * 60);
    orderName.setMaxAge(24 * 60 * 60);
    tel.setMaxAge(24 * 60 * 60);
    zipCode.setMaxAge( 24 * 60 * 60);
    address1.setMaxAge(24 * 60 * 60);
    address2.setMaxAge(24 * 60 * 60);

    // 쿠키를 등록하도록 response 내장 객체의 addCookie() 작성
    response.addCookie(orderId);
    response.addCookie(orderName);
    response.addCookie(tel);
    response.addCookie(zipCode);
    response.addCookie(address1);
    response.addCookie(address2);

    response.sendRedirect("./order_confirm.jsp");
%>