<%@ page import="com.opentime.jsp_market_2506.DTO.Member" %>
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
<%!
    // 폼태그를 가져와서 DTO로 변환
    Member getMemberFromRequest(HttpServletRequest request){
        // 1. 폼태그를 가져와서 변수로 저장
        String memberId = request.getParameter("memberId"); // 아이디

        String passwd = request.getParameter("passwd"); // 비번
        String memberName = request.getParameter("memberName"); // 이름
        String gender = request.getParameter("gender"); // 성별
        String birthday = String.format("%s년 %s월 %s일",request.getParameter("birthYear"),request.getParameter("birthMonth"),request.getParameter("birthDate"));// 생일
        String email = String.format("%s@%s",request.getParameter("email1"),request.getParameter("email2")); // 이메일
        String phone = String.format("%s-%s-%s",request.getParameter("phone1"),request.getParameter("phone2"),request.getParameter("phone3")); // 연락처
        String address = request.getParameter("address"); // 주소

        return Member.builder()
                .memberId(memberId)
                .passwd(passwd)
                .memberName(memberName)
                .gender(gender)
                .birthday(birthday)
                .email(email)
                .phone(phone)
                .address(address)
                .build();
    }
%>
<%@include file="../inc/dbconn.jsp"%>
<%
    // 2. JDBC를 이용하여 DB에 저장
    Member member = getMemberFromRequest(request);
    if (member == null) {
        return;
    }

    PreparedStatement pstmt = null;
    try {
        String sql = "INSERT INTO members (memberId, passwd, memberName, gender, birthday, email, phone, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, member.getMemberId());
        pstmt.setString(2, member.getPasswd());
        pstmt.setString(3, member.getMemberName());
        pstmt.setString(4, member.getGender());
        pstmt.setString(5, member.getBirthday());
        pstmt.setString(6, member.getEmail());
        pstmt.setString(7, member.getPhone());
        pstmt.setString(8, member.getAddress());
        pstmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
        return;
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
    }

    // 3. 페이지 이동
    response.sendRedirect("../member/member_result.jsp?msg=1");
%>
