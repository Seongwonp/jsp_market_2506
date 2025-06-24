<%@ page import="com.opentime.jsp_market_2506.DTO.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String sessionMemberId = (String) session.getAttribute("sessionMemberId");
    Board board = (Board) request.getAttribute("board");

    if (sessionMemberId == null || board == null || !sessionMemberId.equals(board.getMemberId())) {
        response.sendRedirect("../exception/exception_wrong_process.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 수정</title>
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
            개시글 수정
        </h1>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <form name="frmUpdateBoard" action="./boardUpdate.do" class="form-horizontal" method="post">
                <input type="hidden" name="bno" value="<%= board.getBno() %>">
                <input type="hidden" name="pageNum" value="<%= request.getAttribute("pageNum") %>">
                <div class="form-group row">
                    <label for="subject" class="col-sm-2">제목</label>
                    <div class="col-sm-10">
                        <input type="text" id="subject" name="subject" class="form-control" value="<%= board.getSubject() %>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-2">이름</label>
                    <div class="col-sm-10">
                        <input type="text" id="name" name="name" class="form-control" value="<%= board.getName() %>" readonly>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="subject" class="col-sm-2">내용</label>
                    <div class="col-sm-10">
                        <textarea id="content" name="content" cols="50" rows="10" class="form-control"><%= board.getContent() %></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" value="수정" class="btn btn-primary">
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
