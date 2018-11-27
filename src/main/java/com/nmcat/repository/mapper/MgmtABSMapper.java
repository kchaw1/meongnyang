package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Career;
import com.nmcat.repository.domain.License;
import com.nmcat.repository.domain.LoginHistory;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.board.CommunityBoard;

public interface MgmtABSMapper {
	
	List<Member> selectABSList(Member member); // ABS 리스트
//	List<Member> selectABSList(String auth); // ABS 리스트
	LoginHistory selectRecentLogin(String id); // 최근접속일
	Member selectABSDetail(int no); // ABS 디테일
	List<CommunityBoard> selectBoardById(String id); // 내가 쓴 게시글
	void authApprove(int no); // 승인
	void deleteMember(int no); // 탈퇴
	List<Career> selectCareerById(String id); // 경력 조회
	List<Member> searchABSByName(Member member); // 검색
	
	// 정렬
	List<Member> selectABSListSortedbyId(Member member);
	List<Member> selectABSListSortedbyName(Member member);
	List<Member> selectABSListSortedbySignUpDate(Member member);
	List<Member> selectABSListSortedbyScore(Member member);
	List<Member> selectABSListSortedbyPoint(Member member);
	
	// 자격증 이름
	List<License> selectLicenceOriName(String id);
	
}
