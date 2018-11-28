package com.nmcat.mgmt.abs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Career;
import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.License;
import com.nmcat.repository.domain.LoginHistory;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.MgmtSearch;
import com.nmcat.repository.domain.board.CommunityBoard;
import com.nmcat.repository.mapper.MgmtABSMapper;

@Service
public class MgmtABSServiceImpl implements MgmtABSService{
	
	@Autowired
	private MgmtABSMapper mapper;
	
	// 행동전문가 리스트
	@Override
	public List<Member> list(Member member) {
		return mapper.selectABSList(member);
	}
//	@Override
//	public List<Member> list(String auth) {
//		return mapper.selectABSList(auth);
//	}
	
	// 최근접속일
	@Override
	public LoginHistory recentLogin(String id) {
		return mapper.selectRecentLogin(id);
	}
	
	// 디테일
	@Override
	public Member detail(int no) {
		return mapper.selectABSDetail(no);
	}
	
	// 내가 쓴 게시글
	@Override
	public List<CommunityBoard> myPosts(String id) {
		return mapper.selectBoardById(id);
	}
	
	@Override
	public List<CommunityComment> myComments(String id) {
		return mapper.selectCommentById(id);
	}
	
	// 승인
	@Override
	public void authApprove(int no) {
		mapper.authApprove(no);
	}
	
	// 탈퇴
	@Override
	public void deleteMember(int no) {
		mapper.deleteMember(no);
	}
	
	// 경력조회
	@Override
	public List<Career> selectCareer(String id) {
		return mapper.selectCareerById(id);
	}
	
	// 검색
	@Override
	public List<Member> search(MgmtSearch search) {
		return mapper.searchABS(search);
	}
	
	// 자격증 이름 조회
	@Override
	public List<License> licenseName(String id) {
		return mapper.selectLicenceOriName(id);
	}
	
	// 오름차순 정렬
	@Override
	public List<Member> listById(Member member) {
		return mapper.selectABSListSortedbyId(member);
	}
	@Override
	public List<Member> listByName(Member member) {
		return mapper.selectABSListSortedbyName(member);
	}
	@Override
	public List<Member> listBySignUpDate(Member member) {
		return mapper.selectABSListSortedbySignUpDate(member);
	}
	@Override
	public List<Member> listByScore(Member member) {
		return mapper.selectABSListSortedbyScore(member);
	}
	@Override
	public List<Member> listByPoint(Member member) {
		return mapper.selectABSListSortedbyPoint(member);
	}
	
	// 내림차순 정렬
	@Override
	public List<Member> listDesc(Member member) {
		return mapper.selectABSListDesc(member);
	}
	@Override
	public List<Member> listByIdDesc(Member member) {
		return mapper.selectABSListSortedbyIdDesc(member);
	}
	@Override
	public List<Member> listByNameDesc(Member member) {
		return mapper.selectABSListSortedbyNameDesc(member);
	}
	@Override
	public List<Member> listBySignUpDateDesc(Member member) {
		return mapper.selectABSListSortedbySignUpDateDesc(member);
	}
	@Override
	public List<Member> listByScoreDesc(Member member) {
		return mapper.selectABSListSortedbyScoreDesc(member);
	}
	@Override
	public List<Member> listByPointDesc(Member member) {
		return mapper.selectABSListSortedbyPointDesc(member);
	}
}
