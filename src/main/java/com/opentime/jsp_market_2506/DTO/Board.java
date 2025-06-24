package com.opentime.jsp_market_2506.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Board {
    private Integer bno;
    private String memberId;
    private String name;
    private String subject;
    private String content;
    private Integer hit;
    private String ip;
    private String dateTime;
}
