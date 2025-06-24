<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 작성</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script type="text/javascript">
        <%
        if(Boolean.FALSE.equals(session.getAttribute("isAuth")) || session.getAttribute("isAuth") == null){
        %>
            alert("로그인 후 이용해주세요!");
            location.href ="../member/login.jsp";
        <%
            }
        %>
    </script>
</head>
<body>
<%@ include file="../inc/menu.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            개시글 작성
        </h1>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <form name="frmAddBoard" action="./boardAdd.do" class="form-horizontal" method="post">
                <div class="form-group row">
                    <label for="subject" class="col-sm-2">제목</label>
                    <div class="col-sm-10">
                        <input type="text" id="subject" name="subject" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-2">이름</label>
                    <div class="col-sm-10">
                        <input type="text" id="name" name="name" class="form-control">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="subject" class="col-sm-2">내용</label>
                    <div class="col-sm-10">
                        <textarea id="content" name="content" cols="50" rows="10" class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" value="등록" class="btn btn-primary">
                        <input type="reset" value="초기화" class="btn btn-danger">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <hr>
</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>
