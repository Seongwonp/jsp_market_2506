<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원정보</title>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../inc/menu.jsp" %>

<div class="jumbotron">
  <div class="container">
    <h1 class="display-3">
      회원 정보
    </h1>
  </div>
</div>
<div class="container">
  <%
    String msg = request.getParameter("msg");

    if (msg != null) {
      if (msg.equals("0"))
        out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
      else if (msg.equals("1"))
        out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
      else if (msg.equals("2")) {
        String loginName = (String) session.getAttribute("sessionName");
        out.println(" <h2 class='alert alert-danger'>" + loginName + "님 환영합니다</h2>");
      }
    } else {
      out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
    }
  %></div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>
