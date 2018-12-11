package com.nmcat.crowd.service;

import java.util.List;

import com.nmcat.repository.domain.Crowd;
import com.nmcat.repository.domain.CrowdComment;
import com.nmcat.repository.domain.CrowdLike;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.PointMinus;

public interface CrowdService {
	
	void write(Crowd crowd); // 크라우드 펀딩 작성
	List<Crowd> list(Crowd crowd); // 크라우드 펀딩 리스트
	List<Crowd> endList(Crowd crowd); // 크라우드 펀딩 종료된 리스트
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
	void addComment(CrowdComment cc); // 댓글추가
	List<CrowdComment> commentList(int crNo); // 댓글 목록
	Crowd crowdInfo(int crNo); // 정보 가져오기
	void update(Crowd crowd); // 수정하기
	void addPointHistory(PointMinus pm); // 포인트 차감 내역 추가
	List<PointMinus> pointHistory(int crNo); // 글번호에 해당하는 포인트 차감 내역
	void returnPoint(Member member); // 포인트 되돌려주기
	void delete(int crNo); // 크라우드펀딩 삭제
	void sendMsg(String id); // 포인트 환급 메세지 전송
	int commentCheck(CrowdComment cc); // 코멘트 존재 여부 확인
}
