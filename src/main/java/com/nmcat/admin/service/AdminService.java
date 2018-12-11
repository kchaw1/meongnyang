package com.nmcat.admin.service;

import java.util.List;

import com.nmcat.repository.domain.Member;

public interface AdminService {
	
	List<Member> nonAuthABSList(); // 미승인 전문가 리스트
	List<Member> newMemberList(); // 신규 회원 리스트
	int boardCount(); // 게시물수
	int pointCount(); // 포인트사용량
	int visitorCount(); // 방문자수
}
