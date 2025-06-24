package com.opentime.jsp_market_2506.Model;

import com.opentime.jsp_market_2506.DTO.Board;
import com.opentime.jsp_market_2506.database.DBConnection;
import lombok.Cleanup;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Log4j2
public class BoardDAO {
    private static BoardDAO instance;

    private BoardDAO() {

    }
    public static BoardDAO getInstance() {
        if (instance == null) {
            instance = new BoardDAO();
        }
        return instance;
    }


    public boolean insertBoard(Board board) {
        String SQL = "INSERT INTO board (memberId, name, subject, content, hit, ip)" +
                "VALUES (?, ?, ?, ?, ?, ?)";
        try{
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, board.getMemberId());
            preparedStatement.setString(2, board.getName());
            preparedStatement.setString(3, board.getSubject());
            preparedStatement.setString(4, board.getContent());
            preparedStatement.setInt(5, board.getHit());
            preparedStatement.setString(6, board.getIp());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Board> selectBoards(int pageNum, int limit, String items, String text) {
        String SQL;

        // pageNum : 현재 페이지 번호
        // limit : 페이지당 게시글 수
        // items : 검색 항목
        // text : 검색어
        if(items == null || items.isEmpty() || text == null || text.isEmpty()){
            SQL = "SELECT * FROM board ORDER BY bno DESC LIMIT ? OFFSET ?";
        } else{
            SQL = "SELECT * FROM board WHERE " + items + " LIKE '%" + text + "%' ORDER BY bno DESC LIMIT ? OFFSET ?";
        }

        List<Board> boards = new ArrayList<>();
        int startRow = (pageNum - 1) * limit; // 건너뛸 게시글 수
        try{
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, limit);
            preparedStatement.setInt(2, startRow);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Board board = new Board();
                board.setBno(resultSet.getInt("bno"));
                board.setMemberId(resultSet.getString("memberId"));
                board.setName(resultSet.getString("name"));
                board.setSubject(resultSet.getString("subject"));
                board.setContent(resultSet.getString("content"));
                board.setHit(resultSet.getInt("hit"));
                board.setIp(resultSet.getString("ip"));
                board.setDateTime(resultSet.getString("addDate"));
                boards.add(board);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return boards;
    }


    public int countBoards(String items, String text) {
        String SQL;
        // items : 검색 항목
        // text : 검색어
        if(items == null || items.isEmpty() || text == null || text.isEmpty()){
            SQL = "SELECT COUNT(*) FROM board";
        } else{
            SQL = "SELECT COUNT(*) FROM board WHERE " + items + " LIKE '%" + text + "%'";
        }
        int count = 0;
        try{
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                count = resultSet.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return count;
    }

    public boolean deleteBoard(int bno) {
        String SQL = "DELETE FROM board WHERE bno = ?";
        try {
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, bno);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e ) {
            throw new RuntimeException(e);
        }
    }

    public boolean updateBoard(int bno, String content, String subject) {
        String SQL = "UPDATE board SET subject = ? , content = ? WHERE bno = ?";
        try {
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, subject);
            preparedStatement.setString(2, content);
            preparedStatement.setInt(3, bno);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateHit(int bno){
        log.info("updateHit {}",bno);
        String SQL = "UPDATE board SET hit = hit + 1 WHERE bno = ?";
        try{
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, bno);
            preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public Board getBoardById(int bno) {
        log.info("getBoardById {}", bno);
        String SQL = "SELECT bno, memberId, name, subject, content, hit, addDate FROM board WHERE bno = ?";
        Board board = null;
        try{
            @Cleanup Connection connection = DBConnection.getConnection();
            @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, bno);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                board = Board.builder()
                        .bno(resultSet.getInt("bno"))
                        .memberId(resultSet.getString("memberId"))
                        .name(resultSet.getString("name"))
                        .subject(resultSet.getString("subject"))
                        .content(resultSet.getString("content"))
                        .hit(resultSet.getInt("hit"))
                        .dateTime(resultSet.getString("addDate"))
                        .build();
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return board;
    }




}
