<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%
    if (Boolean.TRUE.equals(session.getAttribute("isAuth"))) {
%>
<script>
    alert("이미 로그인되어 있습니다!");
    history.back();
</script>
<%
        return;
    }
%>
<%@ include file="../inc/menu.jsp" %>

<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            회원 가입
        </h1>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <form name="frmAddMember" action="./add_member_process.jsp" class="form-horizontal" method="post">
                <div class="form-group row">
                    <label for="memberId" class="col-sm-2">아이디</label>
                    <div class="col-sm-4">
                        <input type="text" id="memberId" name="memberId" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="passwd" class="col-sm-2">비밀번호</label>
                    <div class="col-sm-7">
                        <input type="password" id="passwd" name="passwd" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="passwordConfirm" class="col-sm-2">비밀번호 확인</label>
                    <div class="col-sm-7">
                        <input type="password" id="passwordConfirm" name="passwordConfirm" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="memberName" class="col-sm-2">이름</label>
                    <div class="col-sm-5">
                        <input type="text" id="memberName" name="memberName" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="gender" class="col-sm-2">성별</label>
                    <div class="col-sm-3">
                        <input type="radio" name="gender" value="남"> 남
                        <input type="radio" name="gender" value="여"> 여
                    </div>
                </div>
                <div class="form-group row">
                    <label for="brithDay" class="col-sm-2">생일</label>
                    <div class="col-sm-7">
                        <select name="birthYear" id="birthYear">
                            <%
                                Calendar calendar = Calendar.getInstance();
                                for (int i = 1990; i <= calendar.get(Calendar.YEAR); i++) {
                            %>
                            <option value="<%=i%>"><%=i%>
                            </option>
                            <%
                                }
                            %>
                        </select>
                        <select name="birthMonth" id="birthMonth">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        <input type="number" name="birthDate" id="birthDate" min="1" max="31">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="email" class="col-sm-2">이메일</label>
                    <input type="text" name="email1" maxlength="50">@
                    <select name="email2">
                        <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>daum.net</option>
                        <option>nate.com</option>
                    </select>
                </div>
                <div class="form-group row">
                    <label for="phone" class="col-sm-2">연락처</label>
                    <div class="col-sm-5 d-flex align-items-center">
                        <select name="phone1" class="form-control" style="width: auto; display: inline-block; margin-right: 5px;">
                            <option>010</option>
                            <option>011</option>
                        </select>
                        <input type="text" id="phone2" name="phone2" class="form-control" style="width: 100px; display: inline-block; margin-right: 5px;">
                        <input type="text" id="phone3" name="phone3" class="form-control" style="width: 100px; display: inline-block;">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="address" class="col-sm-2">주소</label>
                    <div class="col-sm-5">
                        <input type="text" id="address" name="address" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" value="등록" class="btn btn-primary">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <hr>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const frm = document.querySelector('form[name="frmAddMember"]');
        const submit = document.querySelector('input[type="submit"]');

        submit.addEventListener('click', (e) => {
            e.preventDefault();
            if (frm.passwd.value !== frm.passwordConfirm.value) {
                alert("비밀번호와 비밀번호 확인이 다릅니다.");
                return;
            }
            frm.submit();
        });
    });
</script>

<%@ include file="../inc/footer.jsp" %>
</body>
</html>
