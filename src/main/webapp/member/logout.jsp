<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(Boolean.FALSE.equals(session.getAttribute("isAuth"))){
 %>
<script>
    alert("이미 로그아웃 상태입니다!");
    location.href = "login.jsp";
</script>
<%
        return;
    }
  %>
<script>
    if(confirm("로그아웃 하시겠습니까?")){
        location.href = "logout_process.jsp";
}else{
        history.back();
    }
</script>
