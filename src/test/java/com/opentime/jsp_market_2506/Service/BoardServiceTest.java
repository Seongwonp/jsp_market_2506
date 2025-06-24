package com.opentime.jsp_market_2506.Service;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

@Log4j2
class BoardServiceTest {

    BoardService boardService = BoardService.getInstance();
    @Test
    void getBoardById() {
        log.info(boardService.getBoardById(2));

    }
}