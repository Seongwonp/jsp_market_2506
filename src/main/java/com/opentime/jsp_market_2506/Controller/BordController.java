package com.opentime.jsp_market_2506.Controller;

import com.opentime.jsp_market_2506.DTO.Board;
import com.opentime.jsp_market_2506.DTO.PageRequestDTO;
import com.opentime.jsp_market_2506.DTO.PageResponseDTO;
import com.opentime.jsp_market_2506.Service.BoardService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;

@Log4j2
@WebServlet(urlPatterns = "*.do")
public class BordController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardService boardService = BoardService.getInstance();
        String requestURI = req.getRequestURI(); // 요청 URI
        String contextPath = req.getContextPath(); // 컨텍스트 경로
        String command = requestURI.substring(contextPath.length()); // 요청 URI에서 컨텍스트 경로를 제거한 명령어
        log.info("requestURI: {}", requestURI);
        log.info("contextPath: {}", contextPath);
        log.info("command: {}", command); // 파일 경로에서 이름을 불러오기 위한 명령어

        resp.setContentType("text/html:charset=utf-8");
        req.setCharacterEncoding("utf-8");

        HttpSession session = req.getSession();
        String memberId =(String) session.getAttribute("sessionMemberId");

        switch (command) {
            case "/board/boardList.do" -> {
                log.info("게시글 목록 조회 요청");

                int pageNum = 1;
                if(req.getParameter("pageNum") != null){
                    pageNum = Integer.parseInt(req.getParameter("pageNum"));
                }
                PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                        .pageNum(pageNum)
                        .items(req.getParameter("items"))
                        .text(req.getParameter("text"))
                        .build();

               PageResponseDTO pageResponseDTO =  boardService.getBoardList(pageRequestDTO);
               req.setAttribute("pageResponseDTO", pageResponseDTO);

                RequestDispatcher requestDispatcher = req.getRequestDispatcher("../board/list.jsp");
                requestDispatcher.forward(req, resp);
            }

            case "/board/boardAddForm.do"->{
                log.info("개시글 작성 폼 요청");
                if(memberId == null || memberId.trim().isEmpty()){
                    resp.sendRedirect("/member/login.jsp");
                    return;
                }
                // board/add.jsp 포워딩
                req.getRequestDispatcher("/board/add.jsp").forward(req, resp);

            }

            case "/board/boardAdd.do"->{
                log.info("게시글 추가 요청");

                // 1. Board 객체 생성
                // 세션의 정보 가져옴
                if(memberId == null || memberId.trim().isEmpty()){
                    resp.sendRedirect("/member/login.jsp");
                    return;
                }
                Board board = Board.builder()
                        .memberId(memberId)
                        .name(req.getParameter("name"))
                        .subject(req.getParameter("subject"))
                        .content(req.getParameter("content"))
                        .hit(0) // 초기 조회수는 0
                        .ip(req.getRemoteAddr())
                        .build();

                // 2. service 호출
                boardService.addBoard(board); // 글 추가
                resp.sendRedirect("/board/boardList.do");
            }

            case "/board/boardView.do"->{
                log.info("글 상세보기 요청");

                // 1. bno 추출
                int bno = Integer.parseInt(req.getParameter("bno")); // 게시글 번호
                String pageNum = req.getParameter("pageNum");

                // 2. bno 이용해서 board 추출
                Board board = boardService.getBoardById(bno);

                // 3. view로 board 전달
                req.setAttribute("board", board); // 게시글 정보 저장
                req.setAttribute("pageNum", pageNum);

                // 4. board/view.jsp로 전달
                req.getRequestDispatcher("/board/view.jsp").forward(req, resp);
            }

            case "/board/boardUpdateForm.do" -> {
                log.info("수정 폼 요청");
                if(memberId == null || memberId.trim().isEmpty()){
                    resp.sendRedirect("/member/login.jsp");
                    return;
                }

                // 1. bno 추출
                int bno = Integer.parseInt(req.getParameter("bno")); // 게시글 번호
                String pageNum = req.getParameter("pageNum");

                // 2. bno 이용해서 board 추출
                Board board = boardService.getBoardById(bno);
                if(!session.getAttribute("sessionMemberId").equals(memberId) || session.getAttribute("sessionMemberId") == null){
                    resp.sendRedirect("../exception/exception_wrong_process.jsp");
                }
                // 3. view로 board 전달
                req.setAttribute("board", board); // 게시글 정보 저장
                req.setAttribute("pageNum", pageNum);

                // 4. board/view.jsp로 전달
                req.getRequestDispatcher("/board/modify.jsp").forward(req, resp);
            }

            case "/board/boardUpdate.do"->{
                log.info("글 수정 요청");
                if(memberId == null || memberId.trim().isEmpty()){
                    resp.sendRedirect("/member/login.jsp");
                    return;
                }

                // 1. 파라미터 추출
                int bno = Integer.parseInt(req.getParameter("bno")); // 게시글 번호
                String content = req.getParameter("content");
                String subject = req.getParameter("subject");
                String pageNum = req.getParameter("pageNum");

                // 2. 수정 처리
                boolean success = boardService.updateBoard(bno, content, subject);

                // 3. 결과에 따라 리다이렉트
                if(success){
                    resp.sendRedirect("/board/boardView.do?bno=" + bno + "&pageNum=" + pageNum);
                } else{
                    resp.sendRedirect("/board/boardList.do");
                }
            }



            case "/board/boardDelete.do"->{
                log.info("게시글 삭제 요청");
                if (memberId == null || memberId.trim().isEmpty()) {
                    resp.sendRedirect("/member/login.jsp");
                    return;
                }

                int bno = Integer.parseInt(req.getParameter("bno"));

                // 본인 글인지 확인
                Board board = boardService.getBoardById(bno);
                if(board == null || !board.getMemberId().equals(memberId)) {
                    resp.sendRedirect("/exception/exception_wrong_process.jsp");
                    return;
                }

                if(boardService.deleteBoard(bno)){
                    resp.sendRedirect("/board/boardList.do");
                } else {
                    resp.sendRedirect("/exception/exception_wrong_process.jsp");
                }

            }



        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);

    }
}
