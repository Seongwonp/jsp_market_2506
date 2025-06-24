package com.opentime.jsp_market_2506.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        //데이터베이스 연결 정보 저장 및 연결
        String url = "jdbc:mariadb://localhost:3306/jsp_edu_market_2506";
        String user = "root";
        String password = "4464";
        String driver = "org.mariadb.jdbc.Driver";

        //1. 드라이버 로딩
        Class.forName(driver); // org.mariadb.jdbc.Driver 클래스를 메모리에 로딩
        //2. 데이터베이스 연결
        return DriverManager.getConnection(url, user, password);//데이터베이스에 접속;
    }
}
