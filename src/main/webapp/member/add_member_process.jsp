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
    // 폼태그를 가져와서 DTO로 변환
    Member getMemberFromRequest(HttpServletRequest request){
        // 1. 폼태그를 가져와서 변수로 저장
        String memberId = request.getParameter("memberId"); // 아이디
        if(memberId.equals(MemberRepository.getInstance().getMemberById(memberId).getMemberId())){
            return null;
        }
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

<%
    // 2. 저장소에 저장
    MemberRepository memberRepository = MemberRepository.getInstance();
    if(getMemberFromRequest(request) == null){
        return;
    }
    memberRepository.addMember(getMemberFromRequest(request));

    // 3. 페이지 이동
    response.sendRedirect("../member/member_result.jsp?msg=1");
%>

