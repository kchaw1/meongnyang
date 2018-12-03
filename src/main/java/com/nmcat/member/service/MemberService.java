package com.nmcat.member.service;

import com.nmcat.repository.domain.Login;
import com.nmcat.repository.domain.LoginHistory;
import com.nmcat.repository.domain.Member;

public interface MemberService {
	
	void signup(Member member);
	
	Member login(Login login);
	
	boolean checkId(String id);
	
	// 로그인 내역
	void insertHistory(String loginId);
	
	// 로그인 할때 +10
	void updqteScore(String id);
	
	
	
	// 프로필 파일 부분
	
	// 이메일 인증 부분
	String sendMail(Member member);
}
