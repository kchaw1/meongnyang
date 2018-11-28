package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Abs;
import com.nmcat.repository.domain.AbsBoardFile;
import com.nmcat.repository.domain.board.QnABoard;

public interface AbsMapper {

	//행동전문가 리스트 뽑아오기
	List<Abs> selectAbsList(Abs abs);
	
	//행동전문가 상세팝업창
	Abs selectAbsDetail(int no); 
	
	//행동전문가 개별 질문게시판 리스트
	List<QnABoard> selectAbsBoard(int no);
	
	//행동전문가 질문게시판 상세
	QnABoard selectAbsBoardByNo(int no);
	
	//행동전문가 질문 등록
	void insertAbsBoard(QnABoard qnaboard);
	
	//조회수
	int AbsBoardViewCnt(int absNo);
	
	//답변채택
	int AbsBoardComplete(int absNo);
	
	//게시글 삭제
	void AbsDeleteBoard(int absNo);
	
	void insertAbsBoardFile(AbsBoardFile file);
}
