<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
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
            로그인
        </h1>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <form name="frmAddMember" action="./login_process.jsp" class="form-horizontal" method="post">
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
                <p><input type="button" href="../member/login_process.jsp" class="btn btn-info" value="로그인" id="login"
                          name="login">
                    <a href="../member/add_member.jsp" class="btn btn-secondary">회원가입</a>
                </p>
            </form>
        </div>
    </div>
    <hr>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const frm = document.querySelector('form[name="frmAddMember"]');
        const submit = document.querySelector('input[id="login"]');

        submit.addEventListener('click', (e) => {
            e.preventDefault();
            if (frm.memberId.value.trim() === "") {
                alert("아이디를 입력해주세요!");
                return;
            }
            if (frm.passwd.value.trim() === "") {
                alert("비밀변호를 입력해주세요!");
                return;
            }
            frm.submit();
        });
    });
</script>

<%@ include file="../inc/footer.jsp" %>
</body>
</html>
