package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.PointMinus;
import com.nmcat.repository.domain.PointPlus;

public interface PointMapper {

	public void insertPointByPaying(PointPlus plus);
	List<PointPlus> selectAddPoint(String id);
	List<PointMinus> selectMinusPoint(String id);
}
