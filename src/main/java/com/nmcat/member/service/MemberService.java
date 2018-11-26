package com.nmcat.member.service;

import com.nmcat.repository.domain.Login;
import com.nmcat.repository.domain.Member;

public interface MemberService {
	
	void signup(Member member);
	
	Member login(Login login);
	
	boolean checkId(String id);
}
