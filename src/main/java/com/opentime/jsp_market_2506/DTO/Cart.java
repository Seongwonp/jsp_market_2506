package com.opentime.jsp_market_2506.DTO;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private String productId; // 상품 아이디
    private int cartCnt; // 장바구니에 담은 갯수
}
