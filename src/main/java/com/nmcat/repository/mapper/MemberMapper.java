package com.nmcat.repository.mapper;

import com.nmcat.repository.domain.Career;
import com.nmcat.repository.domain.License;
import com.nmcat.repository.domain.Login;
import com.nmcat.repository.domain.Member;

public interface MemberMapper {
	
	public void insertNewMemberNofile(Member member);
	
	public Member selectMemeberIdandPass(Login login);
	
	public String selectId(String id);
	
	public void insertabsMemberfile(Member member);
	
	/**********로그인 + 10**********/
	void updateScore(String id);
	
	/*********경력********/
	void insertCaree(Career career);
	
	/********자격증*********/
	void insertLicense(License license);

} // end class
