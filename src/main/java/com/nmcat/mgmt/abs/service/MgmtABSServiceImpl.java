package com.nmcat.mgmt.abs.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nmcat.repository.domain.Career;
import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.License;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.MgmtSearch;
import com.nmcat.repository.domain.board.CommunityBoard;
import com.nmcat.repository.mapper.MgmtABSMapper;

@Service
public class MgmtABSServiceImpl implements MgmtABSService{
	
	@Autowired
	private MgmtABSMapper mapper;
	
	
	
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
	
	// 내가 쓴 코멘트
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
	public List<Member> list(Member member) { return mapper.selectABSList(member); }
	public List<Member> listById(Member member) { return mapper.selectABSListSortedbyId(member); }
	public List<Member> listByName(Member member) { return mapper.selectABSListSortedbyName(member); }
	public List<Member> listBySignUpDate(Member member) { return mapper.selectABSListSortedbySignUpDate(member); }
	public List<Member> listByRecentLoginDate(Member member) { return mapper.selectABSListSortedbyRecentLoginDate(member); }
	public List<Member> listByScore(Member member) { return mapper.selectABSListSortedbyScore(member); }
	public List<Member> listByPoint(Member member) { return mapper.selectABSListSortedbyPoint(member); }
	
	// 내림차순 정렬
	@Override
	public List<Member> listDesc(Member member) { return mapper.selectABSListDesc(member); }
	public List<Member> listByIdDesc(Member member) { return mapper.selectABSListSortedbyIdDesc(member); } 
	public List<Member> listByNameDesc(Member member) { return mapper.selectABSListSortedbyNameDesc(member); } 
	public List<Member> listBySignUpDateDesc(Member member) { return mapper.selectABSListSortedbySignUpDateDesc(member); }
	public List<Member> listByRecentLoginDateDesc(Member member) { return mapper.selectABSListSortedbyRecentLoginDateDesc(member); }
	public List<Member> listByScoreDesc(Member member) { return mapper.selectABSListSortedbyScoreDesc(member); }
	public List<Member> listByPointDesc(Member member) { return mapper.selectABSListSortedbyPointDesc(member); }
}
