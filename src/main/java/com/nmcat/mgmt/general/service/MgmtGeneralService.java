package com.nmcat.mgmt.general.service;

import java.util.Date;
import java.util.List;

import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.MgmtSearch;

public interface MgmtGeneralService {
	
	Date recentLogin(String id); // 최근접속일
	List<Member> search(MgmtSearch search); // 검색
	
	// 오름차순
	List<Member> generalMemberList();	// 리스트
	List<Member> generalMemberListById(); 
	List<Member> generalMemberListByName();
	List<Member> generalMemberListBySignUpDate();
	List<Member> generalMemberListByRecentLoginDate();
	List<Member> generalMemberListByScore(); 
	List<Member> generalMemberListByPoint(); 
	
	// 내림차순
	List<Member> generalMemberListDesc();
	List<Member> generalMemberListByIdDesc(); 
	List<Member> generalMemberListByNameDesc();
	List<Member> generalMemberListBySignUpDateDesc();
	List<Member> generalMemberListByRecentLoginDateDesc();
	List<Member> generalMemberListByScoreDesc(); 
	List<Member> generalMemberListByPointDesc(); 
}
