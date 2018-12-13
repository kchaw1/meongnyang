package com.nmcat.member.service;

import java.util.Date;
import java.util.List;

import com.nmcat.repository.domain.Career;
import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.License;
import com.nmcat.repository.domain.Login;
import com.nmcat.repository.domain.LoginHistory;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.board.CommunityBoard;

public interface MemberService {
	
	void signup(Member member);
	
	void absup(Member member);
	
	Member login(Login login);
	
	boolean checkId(String id);
	
	// 로그인 내역
	void insertHistory(String loginId);
	
	// 로그인 할때 +10
	void updqteScore(String id);
	
	// 경력
	void insertCaree(Career career);
	
	// 자격증
	void license(License license);
	
	// 이메일 인증 부분
	String sendMail(Member member);
	
	// 네이버 추가정보
	Member naver(Member member);
	
	// 로그아웃 시간
	void updateHistory(String loginId);
	
	// 비밀번호 수정
	void updatePass(Member member);
	
	// 회원정보 수정 할때 비밀번호 재확인
	int selectRelogin(Member member);
	
	// 이메일 수정
	void updateEmail(Member member);
	
	// 프로필 사진 수정
	void updateProfile(Member member);
	
	// 정보가져오기
	Member selectMemberInfo(int no);
	
	// 최근접속일 
	Date selectRac(String id);
	
	// 내가 쓴 게시물
	List<CommunityBoard> selectMyBoard(String id);
	
	// 내가 쓴 댓글
	List<CommunityComment> selectMyComment(String id);
	
	// 로그인 내역 카운트
	int selectHistory(String loginId);
	
}
