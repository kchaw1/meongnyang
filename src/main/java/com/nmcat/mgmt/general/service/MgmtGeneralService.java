package com.nmcat.mgmt.general.service;

import java.util.Date;
import java.util.List;

import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.MgmtSearch;
import com.nmcat.repository.domain.board.CommunityBoard;

public interface MgmtGeneralService {
	
	List<Member> search(MgmtSearch search); // 검색
	Member detail(int no); // 상세
	List<CommunityBoard> myPosts(String id); // 내가 쓴 게시글
	List<CommunityComment> myComments(String id); // 내가 쓴 코멘트
	void deleteMember(int no);
	
	// 오름차순
	List<Member> generalMemberList();	// 리스트 번호순
	List<Member> generalMemberListById();  // 아이디
	List<Member> generalMemberListByName(); // 이름
	List<Member> generalMemberListBySignUpDate(); // 가입일
	List<Member> generalMemberListByRecentLoginDate(); // 최근로그인
	List<Member> generalMemberListByScore(); // 활동점수
	List<Member> generalMemberListByPoint(); // 포인트
	List<Member> generalMemberListByGrade(); // 등급
	
	// 내림차순
	List<Member> generalMemberListDesc(); // 번호
	List<Member> generalMemberListByIdDesc();  // 아이디
	List<Member> generalMemberListByNameDesc(); // 이름
	List<Member> generalMemberListBySignUpDateDesc(); // 가입일
	List<Member> generalMemberListByRecentLoginDateDesc(); // 최근접속일
	List<Member> generalMemberListByScoreDesc();  // 활동점수
	List<Member> generalMemberListByPointDesc();  // 포인트
	List<Member> generalMemberListByGradeDesc(); // 등급
}
