<%--
  Created by IntelliJ IDEA.
  User: park-seongwon
  Date: 25. 6. 20.
  Time: 오전 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>삭제</title>
</head>
<body>
  <script>
    if(confirm("삭제하시겠습니까?")){
      location.href= "./remove_cart_process.jsp"
    }
    location.href="./cart.jsp"
  </script>
</body>
</html>
