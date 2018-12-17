package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Crowd;
import com.nmcat.repository.domain.CrowdComment;
import com.nmcat.repository.domain.CrowdLike;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.PointMinus;

public interface CrowdMapper {
	
	void insertCrowd(Crowd crowd); // 크라우드펀딩 작성
	List<Crowd> selectCrowdList(Crowd crowd); // 크라우드펀딩 리스트
	List<Crowd> selectCrowdEndList(Crowd crowd); // 크라우드펀딩 종료 리스트
	Crowd selectCrowdDetail(int crNo); // 크라우드펀딩 디테일
	int selectLikeCount(int crNo); // 좋아요 개수
	void insertLike(CrowdLike cl); // 좋아요
	void updateLikeCntUp(int crNo); // 개수 올리기
	void deleteLike(CrowdLike cl); // 좋아요 취소
	void updateLikeCntDown(int crNo); // 개수 줄이기
	int selectLikeCheck(CrowdLike cl); // 추천 여부
	void updateNowMoney(Crowd crowd); // 기부하기
	void insertCrowdComment(CrowdComment cc); // 댓글
	List<CrowdComment> selectCrowdComment(int crNo); // 코멘트리스트
	Crowd selectCrowdInfo(int crNo); // 수정페이지 - 기존 정보 가져오기
	void updateCrowd(Crowd crowd); // 수정
	void deleteCrowd(int crNo); // 크라우드펀딩 삭제
	void insertPointReturnMsg(String id); // 포인트 환급 쪽지 전송
	int selectCommentCheck(CrowdComment cc); // 코멘트가 이미 존재하는지 체크
	
}
