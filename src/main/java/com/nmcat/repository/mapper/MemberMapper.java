package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Login;
import com.nmcat.repository.domain.Member;

public interface MemberMapper {
	
	public void insertNewMemberNofile(Member member);
	
	public Member selectMemeberIdandPass(Login login);
	
	public List<String> selectId();
	
	// 프로필 사진 파일
//	void insertProfile(Member member);
} // end class
