package com.nmcat.mgmt.general.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.MgmtSearch;
import com.nmcat.repository.domain.board.CommunityBoard;
import com.nmcat.repository.mapper.MgmtGeneralMapper;

@Service
public class MgmtGeneralServiceImpl implements MgmtGeneralService{
	
	@Autowired
	private MgmtGeneralMapper mapper;
	
	// 상세
	@Override
	public Member detail(int no) {
		return mapper.selectGeneralDetail(no);
	}
	
	// 내가 쓴 게시글
	@Override
	public List<CommunityBoard> myPosts(String id) {
		return mapper.selectBoardById(id);
	}
	
	// 내가 쓴 코멘트
	@Override
	public List<CommunityComment> myComments(String id) {
		return mapper.selectCommentById(id);
	}
	
	// 탈퇴
	@Override
	public void deleteMember(int no) {
		mapper.deleteMember(no);
	}
	
	// 검색
	@Override
	public List<Member> search(MgmtSearch search) {
		return mapper.selectSearchGeneralList(search);
	}
	
	// 포인트 지급
	@Override
	public void payPoint(Member member) {
		mapper.updatePoint(member);
	}

	// 오름차순
	@Override
	public List<Member> generalMemberList() { return mapper.selectGeneralList(); }
	public List<Member> generalMemberListById() { return mapper.selectGeneralListSortedbyId(); }
	public List<Member> generalMemberListByName() { return mapper.selectGeneralListSortedbyName(); }
	public List<Member> generalMemberListBySignUpDate() { return mapper.selectGeneralListSortedbySignUpDate(); }
	public List<Member> generalMemberListByRecentLoginDate() { return mapper.selectGeneralListSortedbyRecentLoginDate(); }
	public List<Member> generalMemberListByScore() { return mapper.selectGeneralListSortedbyScore(); }
	public List<Member> generalMemberListByPoint() { return mapper.selectGeneralListSortedbyPoint(); }
	public List<Member> generalMemberListByGrade() { return mapper.selectGeneralListSortedbyGrade(); }
	
	// 내림차순
	@Override
	public List<Member> generalMemberListDesc() { return mapper.selectGeneralListDesc(); }
	public List<Member> generalMemberListByIdDesc() { return mapper.selectGeneralListSortedbyIdDesc(); }
	public List<Member> generalMemberListByNameDesc() { return mapper.selectGeneralListSortedbyNameDesc(); }
	public List<Member> generalMemberListBySignUpDateDesc() { return mapper.selectGeneralListSortedbySignUpDateDesc(); }
	public List<Member> generalMemberListByRecentLoginDateDesc() { return mapper.selectGeneralListSortedbyRecentLoginDateDesc(); }
	public List<Member> generalMemberListByScoreDesc() { return mapper.selectGeneralListSortedbyScoreDesc(); }
	public List<Member> generalMemberListByPointDesc() { return mapper.selectGeneralListSortedbyPointDesc(); }
	public List<Member> generalMemberListByGradeDesc() { return mapper.selectGeneralListSortedbyGradeDesc(); }
	
}
