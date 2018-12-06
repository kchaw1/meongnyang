package com.nmcat.crowd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Crowd;
import com.nmcat.repository.domain.CrowdComment;
import com.nmcat.repository.domain.CrowdLike;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.PointMinus;
import com.nmcat.repository.mapper.CrowdMapper;

@Service
public class CrowdServiceImpl implements CrowdService{

	@Autowired
	private CrowdMapper mapper;
	
	// 크라우드 펀딩 작성
	@Override
	public void write(Crowd crowd) {
		mapper.insertCrowd(crowd);
	}
	
	// 크라우드 펀딩 리스트
	@Override
	public List<Crowd> list(Crowd crowd) {
		return mapper.selectCrowdList(crowd);
	}
	
	@Override
	public List<Crowd> endList(Crowd crowd) {
		return mapper.selectCrowdEndList(crowd);
	}
	
	// 크라우드 펀딩 디테일
	@Override
	public Crowd detail(int crNo) {
		return mapper.selectCrowdDetail(crNo);
	}
	
	// 좋아요 개수
	@Override
	public int likeCnt(int crNo) {
		return mapper.selectLikeCount(crNo);
	}
	
	
	// 좋아요 개수 줄이기
	@Override
	public void userLikeDown(CrowdLike cl) {
		mapper.deleteLike(cl);
	}
	@Override
	public void likeCntDown(int crNo) {
		mapper.updateLikeCntDown(crNo);
	}
	
	// 좋아요 개수 늘리기
	@Override
	public void userLikeUp(CrowdLike cl) {
		mapper.insertLike(cl);
	}
	@Override
	public void likeCntUp(int crNo) {
		mapper.updateLikeCntUp(crNo);
	}
	
	// 좋아요 여부 체크
	@Override
	public int likeCheck(CrowdLike cl) {
		return mapper.selectLikeCheck(cl);
	}
	
	// 기부하기
	@Override
	public void donate(Crowd crowd) {
		mapper.updateNowMoney(crowd);
	}
	
	// 포인트차감
	@Override
	public void minusPoint(Member member) {
		mapper.updateMemberPoint(member);
	}
	
	// 보유포인트
	@Override
	public int myPoint(int no) {
		return mapper.selectNowPoint(no);
	}
	
	// 댓글 추가
	@Override
	public void addComment(CrowdComment cc) {
		mapper.insertCrowdComment(cc);
	}
	
	// 댓글 목록
	@Override
	public List<CrowdComment> commentList(int crNo) {
		return mapper.selectCrowdComment(crNo);
	}
	
	// 크라우드펀딩 정보 가져오기
	@Override
	public Crowd crowdInfo(int crNo) {
		return mapper.selectCrowdInfo(crNo);
	}
	
	// 크라우드펀딩 수정
	@Override
	public void update(Crowd crowd) {
		mapper.updateCrowd(crowd);
	}
	
	// 포인트 사용내역테이블에 추가
	@Override
	public void addPointHistory(PointMinus pm) {
		mapper.insertPointMinus(pm);
	}
	
	// 포인트내역
	@Override
	public List<PointMinus> pointHistory(int crNo) {
		return mapper.selectPointMinus(crNo);
	}
	
	// 포인트 되돌려주기
	@Override
	public void returnPoint(Member member) {
		mapper.updateMemberPointPlus(member);
	}
	
	// 포인트 삭제
	@Override
	public void delete(int crNo) {
		mapper.deleteCrowd(crNo);
	}
}