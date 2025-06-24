package com.opentime.jsp_market_2506.Model;

import com.opentime.jsp_market_2506.DTO.Board;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

@Log4j2
class BoardDAOTest {
    final BoardDAO boardDAO = BoardDAO.getInstance();
    @Test
    void getInstance() {
    }

    @Test
    void insertBoard() {
        log.info(boardDAO.insertBoard(Board.builder()
                .memberId("admin")
                .name("admin")
                .subject("test subject")
                .content("test content")
                .hit(10)
                .ip("127.0.0.1")
                .build()));
    }

    @Test
    void selectAllBoards() {
        log.info(boardDAO.selectBoards(1,6,"subject","출석"));
    }

    @Test
    void deleteBoard() {
        log.info(boardDAO.deleteBoard(1));
    }
}