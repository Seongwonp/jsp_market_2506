<%@ page import="com.opentime.jsp_market_2506.DTO.Member" %>
<%@ page import="com.opentime.jsp_market_2506.DAO.MemberRepository" %>
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

<%!
    String memberId = "";
    String memberName = "";
    // 인증 처리 함수
    boolean isAuth(HttpServletRequest request) {
        memberId = request.getParameter("memberId"); // 아이디
        String passwd = request.getParameter("passwd"); // 비번
        Member member = MemberRepository.getInstance().getMemberById(memberId);
        if (member != null) {
            if (!memberId.equals(member.getMemberId())) {
                return false;
            }
            memberName = member.getMemberName();
            return passwd.equals(member.getPasswd());
        }
        return false;
    }
%>
<%
    // 인증 처리 결과에 따른 페이지 변화
    if (!isAuth(request)) { // 일치하지 않을 경우
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

