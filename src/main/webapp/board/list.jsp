<%@ page import="java.util.List" %>
<%@ page import="com.opentime.jsp_market_2506.DTO.Board" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.opentime.jsp_market_2506.DTO.PageResponseDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PageResponseDTO pageResponseDTO = (PageResponseDTO) request.getAttribute("pageResponseDTO");
    List<Board> boardList = pageResponseDTO.getBoardList();
    int pageNum = pageResponseDTO.getPageNum();
    int totalPage = pageResponseDTO.getTotalPages();
    int totalCount = pageResponseDTO.getTotalCount();

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="../inc/menu.jsp" %>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            게시판
        </h1>
    </div>
</div>
<div class="container">
    <div>
        <div class=text-right>
            <span class="badge badge-success">전체 <%=totalCount%>건</span>
            <br/><br/>
            <table class="table table-hover">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>조회</th>
                    <th>글쓴이</th>
                </tr>
                <%
                    for (Board board : boardList) {
                %>
                <tr>
                    <td><%=board.getBno()%>
                    </td>
                    <td><%=board.getSubject()%>
                    </td>
                    <td><%=board.getDateTime()%>
                    </td>
                    <td><%=board.getHit()%>
                    </td>
                    <td><%=board.getName()%>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <div>
                <form class="form-inline" action="" method="get">
                    <table class="table table-hover">
                        <tr>
                            <td>
                                <select name="items" class="txt">
                                    <option value="subject">제목에서</option>
                                    <option value="content">본문에서</option>
                                    <option value="name">글쓴이에서</option>
                                </select>
                                <input name="text" type="text"/>
                                <input type="submit" id="btnAdd" class="btn btn-primary" value="검색">
                                <a href="./boardList.do" class="btn btn-danger">취소</a>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="d-flex justify-content-center my-3">
                <%
                    for (int i = 1; i <= totalPage; i++) {
                        if (i == pageNum) {
                %>
                <span class="btn btn-light mx-1"><%=i%></span>
                <%
                } else {
                %>
                <a class="btn btn-dark text-white mx-1" href="./boardList.do?pageNum=<%=i%>&items=&text="><%=i%>
                </a>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
</div>
<%@ include file="../inc/footer.jsp" %>
</body>
</html>
