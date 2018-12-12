package com.nmcat.point.serivce;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.PointMinus;
import com.nmcat.repository.domain.PointPlus;
import com.nmcat.repository.mapper.PointMapper;

@Service
public class PointServiceImpl implements PointService{

	@Autowired
	PointMapper mapper;
	
	@Override
	public void buyPoint(PointPlus plus) {
		plus.setPlusDate(new Date());
		plus.setPlusType("1");
		mapper.insertPointByPaying(plus);
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
