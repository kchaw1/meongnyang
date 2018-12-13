package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.PointMinus;
import com.nmcat.repository.domain.PointPlus;

public interface PointMapper {

	public void insertPointPlusByPaying(PointPlus plus);
	List<PointPlus> selectAddPoint(String id);
	List<PointMinus> selectMinusPoint(String id);
	public void insertPointMinusforUsingFaceChat(PointMinus minus);
	public void insertPointPlusByChating(PointPlus plus);
	public void updatePointOneMember(Member member);

}
