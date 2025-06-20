<%@ page import="com.opentime.jsp_market_2506.DTO.Cart" %>
<%@ page import="java.util.*" %>
<%@ page import="com.opentime.jsp_market_2506.DAO.ProductRepository" %>
<%@ page import="com.opentime.jsp_market_2506.DTO.Product" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../inc/menu.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            장바구니
        </h1>
    </div>
</div>
<div class="container">
    <div class="row p-5">
        <a href="../order/remove_cart_all_process.jsp" class="btn btn-danger mr-2" id="removeAll">비우기</a>
        <a href="../order/remove_cart_select_process.jsp" class="btn btn-danger mr-2" id="selectRemove">선택 지우기</a>
        <script>
            const btnRemoveAll = document.getElementById('removeAll');
            btnRemoveAll.addEventListener('click', function (e) {
                e.preventDefault();
                <% if (session.getAttribute("carts") == null) { %>
                    alert("리스트가 존재하지 않습니다!");
                    location.reload();
                <% } else { %>
                    if (confirm('전체 삭제하시겠습니까?')) {
                        location.href = "./remove_cart_all_process.jsp";
                    } else {
                        location.reload();
                    }
                <% } %>
            });

            const btnRemoveSelect = document.getElementById('selectRemove');
            btnRemoveSelect.addEventListener('click', function (e) {
                e.preventDefault();

            })

        </script>
        <a href="../order/shipping_info.jsp" class="btn btn-success">주문</a>
    </div>
    <div>
        <table class="table table-hover">
            <tr>
                <th></th>
                <th>상품</th>
                <th>가격</th>
                <th>수량</th>
                <th>소계</th>
                <th>비고</th>
            </tr>
            <%
                List<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
                if (carts == null) { // 생성된 목록이 없는 경우, 목록 생성 후 세션에 저장
                    carts = new ArrayList<>();
                    session.setAttribute("carts", carts);
                }

                int sum = 0;
                int count = 0;
                ProductRepository productRepository = ProductRepository.getInstance();
                for (Cart cart : carts) {
                    Product product = productRepository.getProductById(cart.getProductId());
                    int total = product.getUnitPrice() * cart.getCartCnt();
                    count += cart.getCartCnt();
                    sum += total;
            %>
            <tr>
                <td><input type="checkbox" id="isChecked" value="<%=product.getProductId()%>"></td>
                <td><a href="../product/product.jsp?productId=<%=product.getProductId()%>"><%=cart.getProductId()%>
                    - <%=product.getProductName()%>
                </a></td>
                <td><%=String.format("%,d", product.getUnitPrice())%>원</td>
                <td><%=cart.getCartCnt()%>
                </td>
                <td><%=String.format("%,d", total)%>원</td>
                <td><a href="./remove_cart_process.jsp?productId=<%=product.getProductId()%>"
                       class="badge badge-danger">삭제</a>
                </td>
            </tr>
            <%
                }
            %>
            <tr>
                <th></th>
                <th></th>
                <th>총액</th>
                <th><%=String.format("%,d", sum)%>원</th>
                <th></th>
                <th></th>
            </tr>
            <tr>
                <th></th>
                <th></th>
                <th>총 갯수</th>
                <th><%=String.format("%,d", count)%>개</th>
                <th></th>
                <th></th>
            </tr>
        </table>
    </div>
    <hr>
</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>
