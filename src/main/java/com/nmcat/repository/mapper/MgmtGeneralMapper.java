package com.nmcat.repository.mapper;


import java.util.List;
import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.MgmtSearch;
import com.nmcat.repository.domain.board.CommunityBoard;

public interface MgmtGeneralMapper {
	
	List<Member> selectSearchGeneralList(MgmtSearch search); // 검색
	Member selectGeneralDetail(int no); // 일반회원 상세
	List<CommunityBoard> selectBoardById(String id); // 내가 쓴 게시글
	List<CommunityComment> selectCommentById(String id); // 내가 쓴 코멘트
	void deleteMember(int no); // 탈퇴
	void updatePoint(Member member); // 포인트 지급
	
	// 오름차순
	List<Member> selectGeneralList();
	List<Member> selectGeneralListSortedbyId();
	List<Member> selectGeneralListSortedbyName();
	List<Member> selectGeneralListSortedbySignUpDate();
	List<Member> selectGeneralListSortedbyRecentLoginDate();
	List<Member> selectGeneralListSortedbyScore();
	List<Member> selectGeneralListSortedbyPoint();
	List<Member> selectGeneralListSortedbyGrade();
	
	// 내림차순
	List<Member> selectGeneralListDesc();
	List<Member> selectGeneralListSortedbyIdDesc();
	List<Member> selectGeneralListSortedbyNameDesc();
	List<Member> selectGeneralListSortedbySignUpDateDesc();
	List<Member> selectGeneralListSortedbyRecentLoginDateDesc();
	List<Member> selectGeneralListSortedbyScoreDesc();
	List<Member> selectGeneralListSortedbyPointDesc();
	List<Member> selectGeneralListSortedbyGradeDesc();		
}
