package com.opentime.jsp_market_2506.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    private String memberId; // 아이디
    private String passwd; // 비번
    private String memberName; // 이름
    private String gender; // 성별
    private String birthday; // 생일
    private String email; // 이메일
    private String phone; // 연락처
    private String address; // 주소
}
