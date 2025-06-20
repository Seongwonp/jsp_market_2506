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
        if (instance.members.isEmpty()) {
            instance.members.add(Member.builder()
                    .memberId("test")
                    .passwd("1111")
                    .memberName("테스트 사용자")
                    .build());
            instance.members.add(Member.builder()
                    .memberId("admin")
                    .passwd("1234")
                    .memberName("운영자")
                    .build());
        }
        return instance;
    }

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
