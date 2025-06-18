package com.opentime.jsp_market_2506.DAO;

import com.opentime.jsp_market_2506.DTO.Member;
import lombok.Getter;
import lombok.extern.log4j.Log4j2;

import java.util.*;

@Getter
@Log4j2
public class MemberRepository {
    private final List<Member> members = new ArrayList<>();

    // 싱글턴 타입으로 인스턴스 생성
    private static MemberRepository instance = new MemberRepository();

    public static MemberRepository getInstance() {
        return instance;
    }


    // 상품 아이디를 받아서 같은 상품 아이디를 가진 Product 객체를 반환. -> 없을 경우에는 null 반환
    public Member getMemberById(String memberId) {

        for (Member member : members) {
            if (member.getMemberId().equals(memberId)) return member;
        }
        return null;
    }

    public void addMember(Member member) {
        log.info("members: {}", members);
        members.add(member);
    }

}
