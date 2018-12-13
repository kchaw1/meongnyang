package com.nmcat.point.serivce;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Member;
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
		int totalSum = checkPoint(plus.getId());
		Member member = new Member();
		member.setPoint(totalSum);
		member.setId(plus.getId());
		mapper.updatePointOneMember(member);
		return totalSum - plus.getPlusPoint();
	
	}
	
	//현재 포인트 재고 체크..
	@Override
	public int checkPoint(String id) {
		List<PointPlus> plusList = selectAddPoint(id);
		int plusSum = 0;
		for(PointPlus plus : plusList) {
			plusSum += plus.getPlusPoint();
		}
		List<PointMinus> minusList = selectMinusPoint(id);
		int minusSum = 0;
		for(PointMinus minus : minusList) {
			minusSum += minus.getMinusPoint();
		}
		
		return plusSum - minusSum;

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
	
	@Override
	public List<PointMinus> selectMinusPoint(String id) {
		return mapper.selectMinusPoint(id);
	}

}
