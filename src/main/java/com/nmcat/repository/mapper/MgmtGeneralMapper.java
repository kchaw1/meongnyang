package com.nmcat.repository.mapper;

import java.util.Date;
import java.util.List;

import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.MgmtSearch;

public interface MgmtGeneralMapper {
	
	Date selectRecentLogin(String id); // 최근접속일
	List<Member> selectSearchGeneralList(MgmtSearch search);	// 검색
	
	// 오름차순
	List<Member> selectGeneralList();
	List<Member> selectGeneralListSortedbyId();
	List<Member> selectGeneralListSortedbyName();
	List<Member> selectGeneralListSortedbySignUpDate();
	List<Member> selectGeneralListSortedbyRecentLoginDate();
	List<Member> selectGeneralListSortedbyScore();
	List<Member> selectGeneralListSortedbyPoint();
	
	// 내림차순
	List<Member> selectGeneralListDesc();
	List<Member> selectGeneralListSortedbyIdDesc();
	List<Member> selectGeneralListSortedbyNameDesc();
	List<Member> selectGeneralListSortedbySignUpDateDesc();
	List<Member> selectGeneralListSortedbyRecentLoginDateDesc();
	List<Member> selectGeneralListSortedbyScoreDesc();
	List<Member> selectGeneralListSortedbyPointDesc();
	

	
}
