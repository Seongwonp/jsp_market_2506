<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (Boolean.FALSE.equals(session.getAttribute("isAuth"))) {
%>
<script>
    location.href = "login.jsp";
</script>
<%
        return;
    }
%>
<script>
    <%
    session.setAttribute("isAuth", false);
    session.removeAttribute("sessionMemberId");
    session.removeAttribute("sessionName");
    %>
    alert("로그아웃 되었습니다!");
    location.href = "../main/welcome.jsp";
</script>
