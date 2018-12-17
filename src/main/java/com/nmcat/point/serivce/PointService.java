package com.nmcat.point.serivce;

import java.util.List;

import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.Page2;
import com.nmcat.repository.domain.PointMinus;
import com.nmcat.repository.domain.PointPlus;

public interface PointService {

	int buyPoint(PointPlus plus);
	List<PointPlus> selectAddPoint(String id);
	List<PointPlus> selectPagePoint(Page2 page2);
	List<PointMinus> selectMinusPoint(String id);
	int selectPageCount(String id);
	List<PointMinus> selectMinusPage(Page2 page2);
	int selectMinusCount(String id);
	int checkPoint(String id);
	int usePointforFaceChat(PointMinus minus);
	/*void deletePlus(int no);*/
	
	/* 관리자 */
	void payPointByAdmin(Member member);// 관리자 포인트 지급
	void pointHistoryByAdmin(PointPlus pp);// 관리자 포인트 지급 내역

	/* 크라우드 펀딩 */
	void minusPointByCrowd(Member member); // 포인트차감
	int myPointByCrowd(int no); // 보유포인트
	void addPointHistoryByCrowd(PointMinus pm); // 포인트 차감 내역 추가
	List<PointMinus> pointHistoryByCrowd(int crNo); // 글번호에 해당하는 포인트 차감 내역
	void returnPointByCrowd(Member member); // 포인트 되돌려주기
}
