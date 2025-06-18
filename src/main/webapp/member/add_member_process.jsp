<%@ page import="com.opentime.jsp_market_2506.DTO.Member" %>
<%@ page import="com.opentime.jsp_market_2506.DAO.MemberRepository" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-08");
    String memberId = request.getParameter("memberId"); // 아이디
    String passwd = request.getParameter("passwd"); // 비번
    String memberName = request.getParameter("memberName"); // 이름
    String gender = request.getParameter("gender"); // 성별
    String birthday = String.format("%s년 %s월 %s일",request.getParameter("birthYear"),request.getParameter("birthMonth"),request.getParameter("birthDate"));// 생일
    String email = String.format("%s@%s",request.getParameter("email1"),request.getParameter("email2")); // 이메일
    String phone = String.format("%s-%s-%s",request.getParameter("phone1"),request.getParameter("phone2"),request.getParameter("phone3")); // 연락처
    String address = request.getParameter("address"); // 주소
%>
<%
    Member newMember = new Member();
    newMember.setMemberId(memberId);
    newMember.setPasswd(passwd);
    newMember.setMemberName(memberName);
    newMember.setGender(gender);
    newMember.setBirthday(birthday);
    newMember.setEmail(email);
    newMember.setPhone(phone);
    newMember.setAddress(address);
    MemberRepository memberRepository = MemberRepository.getInstance();
    memberRepository.addMember(newMember);

    newMember = memberRepository.getMemberById(memberId);
    out.print(newMember);
    response.sendRedirect("../member/member_result.jsp?msg=1");
%>

