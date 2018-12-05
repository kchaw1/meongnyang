package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Crowd;
import com.nmcat.repository.domain.CrowdLike;
import com.nmcat.repository.domain.Member;

public interface CrowdMapper {
	
	void insertCrowd(Crowd crowd); // 크라우드펀딩 작성
	List<Crowd> selectCrowdList(Crowd crowd); // 크라우드펀딩 리스트
	Crowd selectCrowdDetail(int crNo); // 크라우드펀딩 디테일
	int selectLikeCount(); // 좋아요 개수
	void insertLike(CrowdLike cl); // 좋아요
	void updateLikeCntUp(int crNo); // 개수 올리기
	void deleteLike(CrowdLike cl); // 좋아요 취소
	void updateLikeCntDown(int crNo); // 개수 줄이기
	int selectLikeCheck(CrowdLike cl); // 추천 여부
	void updateNowMoney(Crowd crowd); // 기부하기
	void updateMemberPoint(Member member); // 포인트차감
	int selectNowPoint(int no);
}
