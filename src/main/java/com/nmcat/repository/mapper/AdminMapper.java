package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Member;

public interface AdminMapper {
	
	List<Member> selectNonAuthABSList(); // 미승인 전문가 리스트
	List<Member> selectNewMemberList(); // 신규회원 리스트
	int selectBoardCount(); // 게시물수 
	int selectPointCount(); // 포인트사용량
	int selectVisitorCount(); // 방문자수
}
