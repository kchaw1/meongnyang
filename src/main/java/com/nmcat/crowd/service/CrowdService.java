package com.nmcat.crowd.service;

import java.util.List;

import com.nmcat.repository.domain.Crowd;
import com.nmcat.repository.domain.CrowdLike;
import com.nmcat.repository.domain.Member;

public interface CrowdService {
	
	void write(Crowd crowd); // 크라우드 펀딩 작성
	List<Crowd> list(Crowd crowd); // 크라우드 펀딩 리스트
	Crowd detail(int crNo); // 크라우드 펀딩 디테일
	int likeCnt(int crNo); // 좋아요 개수
	void userLikeUp(CrowdLike cl);  // 내역테이블에 넣기
	void likeCntUp(int crNo); // 좋아요 숫자 올림
	void userLikeDown(CrowdLike cl); // 내역테이블에서 빼기
	void likeCntDown(int crNo); // 좋아요 숫자 줄임
	int likeCheck(CrowdLike cl); // 좋아요 여부 체크
	void donate(Crowd crowd); // 기부하기
	void minusPoint(Member member); // 포인트차감
	int myPoint(int no); // 보유포인트
}
