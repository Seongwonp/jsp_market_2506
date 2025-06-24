package com.opentime.jsp_market_2506.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PageRequestDTO {
    private int pageNum; // 페이지 번호
    private String items; // 검색 항목
    private String text; // 검색어
}
