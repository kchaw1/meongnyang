package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.Page2;
import com.nmcat.repository.domain.PointMinus;
import com.nmcat.repository.domain.PointPlus;

public interface PointMapper {

	public void insertPointPlusByPaying(PointPlus plus);
	List<PointPlus> selectAddPoint(String id);
	List<PointPlus> selectPagePoint(Page2 page2);
	int selectPageCount(String id);
	List<PointMinus> selectMinusPage(Page2 page2);
	List<PointMinus> selectMinusPoint(String id);
	int selectMinusCount(String id);
	public void insertPointMinusforUsingFaceChat(PointMinus minus);
	public void insertPointPlusByChating(PointPlus plus);
	public void updatePointOneMember(Member member);
	public int selectNowPointById(String id);
	/*void deletePlus(int no);*/
	
	// 관리자
	void updatePointByAdmin(Member member); // 포인트 지급
	void insertPointHistoryByAdmin(PointPlus pp); // 포인트 내역 추가
	
	// 크라우드 펀딩
	void updateMemberPointByCrowd(Member member); // 포인트차감
	int selectNowPointByCrowd(int no); // 보유포인트
	void insertPointMinusByCrowd(PointMinus pm); // 포인트 차감내역 추가
	List<PointMinus> selectPointMinusByCrowd(int crNo); // 글번호에 해당하는 포인트내역 가져오기
	void updateMemberPointPlusByCrowd(Member member); // 포인트 되돌려주기

}
