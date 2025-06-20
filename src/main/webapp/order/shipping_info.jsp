<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>배송 정보</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../inc/menu.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">배송 정보</h1>
    </div>
</div>
<%
    /* 주문번호 생성 및 사용
     ex) 20250617113055-A2DF473D7927277D6E2AA60941448469
     주문번호는 현재 날짜와 시간, 그리고 세션 ID를 조합하여 생성.
     다른 주문과의 충돌을 방지하기 위해 세션 ID를 포함.
      */
    // 세션 ID 가져오기
    String sessionId = session.getId();

    // 현재 날짜 시간 가져오기
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
    String currentDateTime = simpleDateFormat.format(new java.util.Date());

    // 주문번호 생성
    String orderId = currentDateTime + "-" + sessionId;
%>
<div class="container">
    <form name="frmShippingInfo" class="form-horizontal"
          action="../order/shipping_info_process.jsp" method="post">
        <input type="hidden" name="orderId" value="<%=orderId%>">
        <div class="form-group row">
            <label for="orderName" class="col-sm-3">주문자 이름</label>
            <input type="text" id="orderName" name="orderName" required>
        </div>
        <div class="form-group row">
            <label for="tel" class="col-sm-3">연락처</label>
            <input type="text" id="tel" name="tel" required>
        </div>
        <div class="form-group row">
            <label for="zipCode" class="col-sm-3">우편번호</label>
            <input type="text" id="zipCode" name="zipCode" required>
        </div>
        <div class="form-group row">
            <label for="address1" class="col-sm-3">주소 1</label>
            <input type="text" id="address1" name="address1" required>
        </div>
        <div class="form-group row">
            <label for="address2" class="col-sm-3">상세 주소</label>
            <input type="text" id="address2" name="address2" required>
        </div>
        <div class="form-group row">
            <a href="./cart.jsp" class="btn btn-secondary mr-3">이전</a>
            <button class="btn btn-primary" type="submit">등록</button>
        </div>
    </form>
    <hr>
</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>