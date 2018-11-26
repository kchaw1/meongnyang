package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Career;
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
	List<Career> selectCareerById(String id); // 경력 조회
	
}
