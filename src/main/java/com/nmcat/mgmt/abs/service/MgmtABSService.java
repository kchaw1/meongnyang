package com.nmcat.mgmt.abs.service;

import java.util.List;

import com.nmcat.repository.domain.Career;
import com.nmcat.repository.domain.License;
import com.nmcat.repository.domain.LoginHistory;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.board.CommunityBoard;

public interface MgmtABSService {

	List<Member> list(Member member); // 리스트
//	List<Member> list(String auth);
	LoginHistory recentLogin(String id); // 최근접속일
	Member detail(int no); // 상세
	List<CommunityBoard> myPosts(String id); // 내가 쓴 게시글
	void authApprove(int no); // 승인
	void deleteMember(int no); // 탈퇴
	List<Career> selectCareer(String id); // 경력조회
	List<Member> search(Member member); // 검색
	List<License> licenseName(String id);// 자격증 이름
	
	// 정렬
	List<Member> listById(Member member);
	List<Member> listByName(Member member);
	List<Member> listBySignUpDate(Member member);
	List<Member> listByScore(Member member);
	List<Member> listByPoint(Member member);
	
	
	
}
