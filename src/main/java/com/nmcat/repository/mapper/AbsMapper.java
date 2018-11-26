package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Abs;

public interface AbsMapper {

	//행동전문가 리스트 뽑아오기
	List<Abs> selectAbsList(Abs abs);
	
	Abs selectAbsDetail(int no); //상세

}
