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
	void updateMemberPoint(Member member); // 포인트차감
	int selectNowPoint(int no); // 보유포인트
	void insertCrowdComment(CrowdComment cc); // 댓글
	List<CrowdComment> selectCrowdComment(int crNo); // 코멘트리스트
	Crowd selectCrowdInfo(int crNo); // 수정페이지 - 기존 정보 가져오기
	void updateCrowd(Crowd crowd); // 수정
	void insertPointMinus(PointMinus pm); // 포인트 차감내역 추가
	List<PointMinus> selectPointMinus(int crNo); // 글번호에 해당하는 포인트내역 가져오기
	void updateMemberPointPlus(Member member); // 포인트 되돌려주기
	void deleteCrowd(int crNo); // 크라우드펀딩 삭제
}
