<%@ page import="com.opentime.jsp_market_2506.DTO.Board" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Board board =(Board) request.getAttribute("board");
    String pageNum = (String) request.getAttribute("pageNum");
    if (board == null) {
        response.sendRedirect("../exception/no_page.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=board.getSubject()%></title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../inc/menu.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            <%=board.getSubject()%>
        </h1>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <p class="col-sm-6"><strong>이름:</strong> <%=board.getName()%></p>
                <p class="col-sm-6"><strong>조회수:</strong> <%=board.getHit()%></p>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"><strong>내용:</strong></label>
                <div class="col-sm-10">
                    <div class="border p-3 bg-light" style="white-space: pre-wrap;"><%=board.getContent()%></div>
                </div>
            </div>
            <div class="form-group row justify-content-end">
                <div class="col-auto">
                    <a href="./boardList.do?pageNum=<%=pageNum%>" class="btn btn-primary">목록</a>
                    <%
                        String sessionMemberId = (String) session.getAttribute("sessionMemberId");
                        if(sessionMemberId != null && sessionMemberId.equals(board.getMemberId())){
                    %>
                    <div class="btn-group">
                        <button id="updateButton" class="btn btn-info">수정</button>
                        <script>
                            document.addEventListener("DOMContentLoaded", function () {
                                const updateBtn = document.getElementById("updateButton");
                                updateBtn.addEventListener("click", function () {
                                    location.href = `./boardUpdateForm.do?bno=<%=board.getBno()%>&pageNum=<%=pageNum%>`;
                                });
                            });
                        </script>
                      <form action="./boardDelete.do" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');" style="display:inline; margin-left: 5px; ">
                        <input type="hidden" name="bno" value="<%=board.getBno()%>">
                        <input type="hidden" name="pageNum" value="<%=pageNum%>">
                        <button type="submit" class="btn btn-danger">삭제</button>
                      </form>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
    <hr>
</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>
