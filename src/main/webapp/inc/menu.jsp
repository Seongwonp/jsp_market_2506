<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand  navbar-dark bg-dark">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="../main/welcome.jsp">Home</a>
        </div>
        <div>
            <ul class="navbar-nav mr-auto">
                <%
                    if (Boolean.TRUE.equals(session.getAttribute("isAuth"))) {
                %>
                <li class="nav-item"><a class="nav-link" href="../member/logout.jsp">로그아웃</a></li>
                <li class="nav-item"><a class="nav-link" href="../member/modify_member.jsp">정보수정</a></li>
                <%
                } else {
                %>
                <li class="nav-item"><a class="nav-link" href="../member/login.jsp">로그인</a></li>
                <li class="nav-item"><a class="nav-link" href="../member/add_member.jsp">회원 가입</a></li>
                <%
                    }
                %>
                <li class="nav-item"><a class="nav-link" href="../product/product_list.jsp">상품 목록</a></li>
                <li class="nav-item"><a class="nav-link" href="../order/cart.jsp">장바구니</a></li>
                <li class="nav-item"><a class="nav-link" href="../board/boardList.do">게시판</a></li>
                <%
                    if ("admin".equals(session.getAttribute("sessionMemberId"))) {
                %>
                <li class="nav-item"><a class="nav-link" href="../admin/add_product.jsp">상품등록</a></li>
                <li class="nav-item"><a class="nav-link" href="../admin/edit_product.jsp">상품 편집</a></li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>
