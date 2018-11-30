package com.nmcat.point.serivce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.PointPlus;
import com.nmcat.repository.mapper.PointMapper;

@Service
public class PointServiceImpl implements PointService{

	@Autowired
	PointMapper mapper;
	
	@Override
	public void buyPoint(PointPlus plus) {
		mapper.insertPointByPaying(plus);
	}

}
