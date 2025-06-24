<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../inc/dbconn.jsp"%>
<%
    String productId = request.getParameter("productId");
%>
<script>
    if(confirm("해당 상품을 삭제하시겠습니까? (삭제후 복구불가능)")){
        location.href="./delete_product_process.jsp?productId=<%=productId%>"
    }else{
        location.reload();
    }
</script>
