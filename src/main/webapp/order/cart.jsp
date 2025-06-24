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
    <title>장바구니</title>
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
        <a href="./remove_cart_all_process.jsp" class="btn btn-danger mr-2" id="removeAll">비우기</a>
        <button id="selectRemove" class="btn btn-danger mr-2">선택 지우기</button>
        <a href="../order/shipping_info.jsp" class="btn btn-success">주문</a>
    </div>
    <div>
        <table class="table table-hover">
        <tr>
            <th><input type="checkbox" id="checkAll">&nbsp;전체선택</th>
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
            <td><input type="checkbox" class="product-checkbox" value="<%=product.getProductId()%>"></td>
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
<script>
document.getElementById('selectRemove').addEventListener('click', function() {
    const checkedBoxes = document.querySelectorAll('input.product-checkbox:checked');
    if (checkedBoxes.length === 0) {
        alert('선택된 상품이 없습니다!');
        return;
    }

    if (!confirm('해당 제품들을 삭제하시겠습니까?')) return;

    const ids = Array.from(checkedBoxes).map(cb => cb.value);
    const query = ids.map(id => 'productId=' + encodeURIComponent(id)).join('&');
    location.href = './remove_cart_select_process.jsp?' + query;
});

document.addEventListener('DOMContentLoaded', function () {
    const checkAll = document.getElementById('checkAll');
    const checkboxes = document.querySelectorAll('input.product-checkbox');

    checkAll.addEventListener('change', function () {
        checkboxes.forEach(cb => cb.checked = checkAll.checked);
    });
});
</script>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>
