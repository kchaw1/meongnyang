package com.nmcat.abs.service;

import java.util.Map;

import com.nmcat.repository.domain.Abs;
import com.nmcat.repository.domain.board.QnABoard;

public interface AbsService {

	
	Map<String, Object> list(Abs abs); // 조회
	
	Map<String, Object> detail(int no);
	Map<String, Object> detailIntro(int no);

	Map<String, Object> absboardlist(int no);
	

	void write(QnABoard qnaboard);
}
