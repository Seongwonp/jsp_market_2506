package com.opentime.jsp_market_2506.DTO;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private String productId; // 상품 아이디
    private String productName; // 상품명
    private int unitPrice; // 상품 가격
    private String description; // 상품 설명
    private String manufacturer; // 제조사
    private String category; // 분류
    private int unitsInStock; // 재고수
    private String condition; // 신상품 or 중고 or 재생품

    // 상품(아이디, 이름, 가격) 생성자
    public Product(String productId, String productName, Integer unitPrice){
        this.productId = productId;
        this.productName = productName;
        this.unitPrice = unitPrice;
    }
}
