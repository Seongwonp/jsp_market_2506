<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //데이터베이스 연결 정보 저장 및 연결
     String url = "jdbc:mariadb://localhost:3306/jsp_edu_market_2506";
     String user = "root";
     String password = "4464";
     String driver = "org.mariadb.jdbc.Driver";
     Connection connection = null;
    try{
        //1. 드라이버 로딩
        Class.forName(driver); // org.mariadb.jdbc.Driver 클래스를 메모리에 로딩
        //2. 데이터베이스 연결
        connection = DriverManager.getConnection(url, user, password);//데이터베이스에 접속
    } catch (ClassNotFoundException e) { //드라이버 로딩 실패시
        out.println("데이터 베이스 연결에 실패했습니다: " + e.getMessage());
    } catch (SQLException e) { //실패시
        throw new RuntimeException(e);
    }
%>
