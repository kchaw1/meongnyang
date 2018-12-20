package com.nmcat.point.serivce;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.Page2;
import com.nmcat.repository.domain.PointMinus;
import com.nmcat.repository.domain.PointPlus;
import com.nmcat.repository.mapper.PointMapper;

@Service
public class PointServiceImpl implements PointService{

	@Autowired
	PointMapper mapper;
	
	@Override
	public int buyPoint(PointPlus plus) {
		plus.setPlusDate(new Date());
		plus.setPlusType("1");
		mapper.insertPointPlusByPaying(plus);
		int totalSum = checkPoint(plus.getId()) + plus.getPlusPoint();
		Member member = new Member();
		member.setPoint(totalSum);
		member.setId(plus.getId());
		System.out.println("member : " + member);
		mapper.updatePointOneMember(member);
		return totalSum;
	
	}
	
	//현재 포인트 재고 체크..
	@Override
	public int checkPoint(String id) {
		return mapper.selectNowPointById(id);
	}

	@Override
	public int usePointforFaceChat(PointMinus minus) {
		Date now = new Date();
		minus.setMinusDate(now);
		mapper.insertPointMinusforUsingFaceChat(minus);
		PointPlus plus = new PointPlus();
		plus.setId(minus.getAbsId());
		plus.setPlusPoint((int)(minus.getMinusPoint()*0.9));
		plus.setPlusDate(now);
		plus.setPlusType("3");
		mapper.insertPointPlusByChating(plus);
		//포인트를 사용한 반려인 포인트 update
		int idTotal = checkPoint(minus.getId());
		Member member = new Member();
		member.setPoint(idTotal);
		member.setId(minus.getId());
		mapper.updatePointOneMember(member);
		//포인트를 받은 전문가 포인트 update
		int AbsTotal = checkPoint(minus.getAbsId());
		member.setPoint(AbsTotal);
		member.setId(minus.getAbsId());
		mapper.updatePointOneMember(member);
		
		return idTotal;
	}
	
	// 획득 포인트 내역 
	@Override
	public List<PointPlus> selectAddPoint(String id) {
		return mapper.selectAddPoint(id);
	}
	
	// 사용 포인트 내역
	@Override
	public List<PointMinus> selectMinusPoint(String id) {
		return mapper.selectMinusPoint(id);
	}

	// 획득 포인트 페이징
	@Override
	public List<PointPlus> selectPagePoint(Page2 page2) {
		return mapper.selectPagePoint(page2);
	}

	// 전체 게시물 수 
	@Override
	public int selectPageCount(String id) {
		return mapper.selectPageCount(id);
	}

	// 사용 포인트 페이징 
	@Override
	public List<PointMinus> selectMinusPage(Page2 page2) {
		return mapper.selectMinusPage(page2);
	}

	// 사용포인트 게시물 수 
	@Override
	public int selectMinusCount(String id) {
		return mapper.selectMinusCount(id);
	}

	
	/*@Override
	public void deletePlus(int no) {
		mapper.deletePlus(no);
		
	}*/
	
	/* 관리자 */
	// 관리자 포인트 지급
	@Override
	public void payPointByAdmin(Member member) {
		mapper.updatePointByAdmin(member);
	}
	// 관리자 포인트 지급 내역
	@Override
	public void pointHistoryByAdmin(PointPlus pp) {
		mapper.insertPointHistoryByAdmin(pp);
	}
	
	/* 크라우드 펀딩 */
	// 포인트 차감
	@Override
	public void minusPointByCrowd(Member member) {
		mapper.updateMemberPointByCrowd(member);
	}
	// 보유포인트 조회
	@Override
	public int myPointByCrowd(int no) {
		return mapper.selectNowPointByCrowd(no);
	}
	// 포인트 차감 내역 추가
	@Override
	public void addPointHistoryByCrowd(PointMinus pm) {
		mapper.insertPointMinusByCrowd(pm);
	}
	// 글번호에 해당하는 포인트 차감 내역
	@Override
	public List<PointMinus> pointHistoryByCrowd(int crNo) {
		return mapper.selectPointMinusByCrowd(crNo);
	}
	// 포인트 되돌려주기
	@Override
	public void returnPointByCrowd(Member member) {
		mapper.updateMemberPointPlusByCrowd(member);
	}
	

}
