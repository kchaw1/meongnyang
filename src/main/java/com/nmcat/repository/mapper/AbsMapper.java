package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Abs;
import com.nmcat.repository.domain.board.QnABoard;

public interface AbsMapper {

	//행동전문가 리스트 뽑아오기
	List<Abs> selectAbsList(Abs abs);
	
	//행동전문가 상세팝업창
	Abs selectAbsDetail(int no); 
	
	List<QnABoard> selectAbsBoard(int no);
	
	void insertAbsBoard(QnABoard qnaboard);
}
