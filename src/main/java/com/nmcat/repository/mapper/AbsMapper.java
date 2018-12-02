package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Abs;
import com.nmcat.repository.domain.AbsBoardFile;
import com.nmcat.repository.domain.AbsComment;
import com.nmcat.repository.domain.AbsLikeVO;
import com.nmcat.repository.domain.AbsSearchVO;
import com.nmcat.repository.domain.board.QnABoard;

public interface AbsMapper {

	//행동전문가 리스트 뽑아오기
	List<Abs> selectAbsList(Abs abs);
	
	//행동전문가 상세팝업창
	Abs selectAbsDetail(int no); 
	
	//행동전문가 개별 질문게시판 리스트
	List<QnABoard> selectAbsBoard(int no, int begin);
	
	//행동전문가 개별 질문게시판 검색
	List<QnABoard> selectAbsBoardSearch(AbsSearchVO absSearch);
	
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
	
	//파일 등록
	void insertAbsBoardFile(AbsBoardFile file);

	//게시글 수정
	void updateAbsBoard(QnABoard qnaboard);
	
	//게시글 댓글 리스트
	List<AbsComment> selectCommentListByabsNo(int absNo);

	//게시글 댓글 등록
	void insertComment(AbsComment comment);
	
	//게시글 댓글 삭제
	void deleteComment(int abscNo);

	int like(int no); // 행동전문가 추천수
	int likeCount(AbsLikeVO likeVO); // 행동전문가 추천여부 확인
	void insertLike(AbsLikeVO likeVO); //행동전문가 추천
	void updateLike(int no); //행동전문가 총 추천수 증가
	void deleteLike(AbsLikeVO likeVO); //행동전문가 추천 취소
	void cancelLike(int no);  // 행동전문가 총 추천수 감소
	
	int selectCntBoard();

	List<QnABoard> selectAbsBoard(QnABoard board);


}
