package com.opentime.jsp_market_2506.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PageResponseDTO {
    private List<Board> boardList; //목록
    private int pageNum ; //현제 페이지 정보
    private int totalPages; // 전체 페이지 수
    private int totalCount; // 전체 게시글 개수
}
