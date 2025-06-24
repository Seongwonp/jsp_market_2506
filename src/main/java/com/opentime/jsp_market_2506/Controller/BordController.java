package com.opentime.jsp_market_2506.Controller;

import com.opentime.jsp_market_2506.DTO.PageRequestDTO;
import com.opentime.jsp_market_2506.DTO.PageResponseDTO;
import com.opentime.jsp_market_2506.Service.BoardService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.log4j.Log4j2;

import java.io.IOException;

@Log4j2
@WebServlet(urlPatterns = "/board/boardList.do")
public class BordController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardService boardService = BoardService.getInstance();
        String requestURI = req.getRequestURI(); // 요청 URI
        String contextPath = req.getContextPath(); // 컨텍스트 경로
        String command = requestURI.substring(contextPath.length()); // 요청 URI에서 컨텍스트 경로를 제거한 명령어
//        log.info("requestURI: {}", requestURI);
//        log.info("contextPath: {}", contextPath);
//        log.info("command: {}", command); // 파일 경로에서 이름을 불러오기 위한 명령어

        resp.setContentType("text/html:charset=utf-8");
        req.setCharacterEncoding("utf-8");

        switch (command) {
            case "/board/boardList.do" -> {
//                log.info("게시글 목록 조회 요청");

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
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);

    }
}
