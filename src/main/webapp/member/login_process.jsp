<%@ page import="com.opentime.jsp_market_2506.DTO.Member" %>
<%@ page import="com.opentime.jsp_market_2506.DAO.MemberRepository" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (Boolean.TRUE.equals(session.getAttribute("isAuth"))) {
%>
<script>
    history.back();
</script>
<%
        return;
    }
%>
<%@include file="../inc/dbconn.jsp"%>
<%
    String memberId;
    String memberName = "";

    memberId = request.getParameter("memberId");
    String passwd = request.getParameter("passwd");
    boolean isAuth = false;

    String SQL = "SELECT * FROM members WHERE memberId = ?";
    try {
        PreparedStatement preparedStatement = connection.prepareStatement(SQL);
        preparedStatement.setString(1, memberId);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            String dbId = resultSet.getString("memberId");
            String dbpass = resultSet.getString("passwd");
            memberName = resultSet.getString("memberName");
            if(dbId.equals(memberId) && dbpass.equals(passwd)){
                isAuth = true;
            }
        }
        resultSet.close();
        preparedStatement.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%
    if (!isAuth) {
%>
<script>
    alert("아이디 또는 비밀번호가 일치하지 않습니다!")
    location.href = "login.jsp";
</script>
<%
        return;
    }
        session.setAttribute("isAuth", true);
        session.setAttribute("sessionMemberId", memberId); // 아이디를 서버에다가 저장
        session.setAttribute("sessionName", memberName);  // 닉네임 저장
        response.sendRedirect("../member/member_result.jsp?msg=2");

%>
