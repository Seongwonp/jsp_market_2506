package com.opentime.jsp_market_2506.Service;

import com.opentime.jsp_market_2506.DTO.Board;
import com.opentime.jsp_market_2506.DTO.PageRequestDTO;
import com.opentime.jsp_market_2506.DTO.PageResponseDTO;
import com.opentime.jsp_market_2506.Model.BoardDAO;
import lombok.extern.log4j.Log4j2;

import java.util.List;

@Log4j2
public class BoardService {
    static final int listCount = 5; // 페이지당
    static final BoardDAO borderDAO = BoardDAO.getInstance();

    private static BoardService instance;
    private BoardService() {}
    public static BoardService getInstance() {
        if(instance == null) instance = new BoardService();
        return instance;
    }

    public PageResponseDTO getBoardList(PageRequestDTO pageRequestDTO) {

        int limit = listCount;

        // 2. 게시글 목록을 조회
        int totalCount = borderDAO.countBoards(pageRequestDTO.getItems(), pageRequestDTO.getText());
        List<Board> boardList = borderDAO.selectBoards(pageRequestDTO.getPageNum(), limit, pageRequestDTO.getItems(), pageRequestDTO.getText());

        // 3. 전체 페이지 수 계산
        int totalPage;
        if(totalCount % limit == 0){
            totalPage = totalCount / limit; // 전체 게시글 갯수가 페이지당 게시글 수로 나누어 떨어질 떄
        }else{
            totalPage = (totalCount / limit) + 1; // 나누어 덜어지지 않을떄
        }


        // 4. pageResponseDTO 에 게시글 목록과 페이지 정보 저장

        return PageResponseDTO.builder()
                .boardList(boardList)
                .totalCount(totalCount)
                .pageNum(pageRequestDTO.getPageNum())
                .totalPages(totalPage)
                .build();
    }

    public void addBoard(Board board) {
        log.info("add board");
        borderDAO.insertBoard(board); // 게시글 추가
    }

    public Board getBoardById(int bno) {
        log.info("get board by id");
        if(borderDAO.getBoardById(bno) != null) borderDAO.updateHit(bno);
        return borderDAO.getBoardById(bno);
    }

    public boolean deleteBoard(int bno) {
        log.info("delete board");
        return borderDAO.deleteBoard(bno);
    }

    public boolean updateBoard(int bno, String content, String subject) {
        log.info("update board");
        return borderDAO.updateBoard(bno, content, subject);

    }

}
