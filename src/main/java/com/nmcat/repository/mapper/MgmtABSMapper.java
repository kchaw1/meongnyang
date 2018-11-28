package com.nmcat.repository.mapper;

import java.util.Date;
import java.util.List;

import com.nmcat.repository.domain.Career;
import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.License;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.MgmtSearch;
import com.nmcat.repository.domain.board.CommunityBoard;

public interface MgmtABSMapper {
	
	List<Member> selectABSList(Member member); // ABS 리스트
	Date selectRecentLogin(String id); // 최근접속일
	Member selectABSDetail(int no); // ABS 디테일
	List<CommunityBoard> selectBoardById(String id); // 내가 쓴 게시글
	List<CommunityComment> selectCommentById(String id);
	void authApprove(int no); // 승인
	void deleteMember(int no); // 탈퇴
	List<Career> selectCareerById(String id); // 경력 조회
	List<Member> searchABS(MgmtSearch search); // 검색
	List<License> selectLicenceOriName(String id); // 자격증 이름
	
	// 오름차순정렬
	List<Member> selectABSListSortedbyId(Member member);
	List<Member> selectABSListSortedbyName(Member member);
	List<Member> selectABSListSortedbySignUpDate(Member member);
	List<Member> selectABSListSortedbyScore(Member member);
	List<Member> selectABSListSortedbyPoint(Member member);
	
	// 내림차순
	List<Member> selectABSListDesc(Member member);
	List<Member> selectABSListSortedbyIdDesc(Member member);
	List<Member> selectABSListSortedbyNameDesc(Member member);
	List<Member> selectABSListSortedbySignUpDateDesc(Member member);
	List<Member> selectABSListSortedbyScoreDesc(Member member);
	List<Member> selectABSListSortedbyPointDesc(Member member);
}
