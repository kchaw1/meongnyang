package com.nmcat.member.service;

import com.nmcat.repository.domain.Career;
import com.nmcat.repository.domain.License;
import com.nmcat.repository.domain.Login;
import com.nmcat.repository.domain.Member;

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
}
