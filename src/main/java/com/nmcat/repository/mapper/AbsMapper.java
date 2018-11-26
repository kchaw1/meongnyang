package com.nmcat.repository.mapper;

import com.nmcat.repository.domain.Abs;

public interface AbsMapper {

	//행동전문가 리스트 뽑아오기
	Abs selectAbsList(int type);
}
