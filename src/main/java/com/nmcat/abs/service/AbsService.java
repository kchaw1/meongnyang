package com.nmcat.abs.service;

import java.util.List;
import java.util.Map;

import com.nmcat.repository.domain.Abs;
import com.nmcat.repository.domain.AbsBoardFile;
import com.nmcat.repository.domain.AbsComment;
import com.nmcat.repository.domain.AbsLikeVO;
import com.nmcat.repository.domain.board.QnABoard;

public interface AbsService {

	
	Map<String, Object> list(Abs abs); // 조회
	
	Map<String, Object> detail(int no);
	Map<String, Object> detailIntro(int no);

	Map<String, Object> absboardlist(int no, int pageNo);
	

	void write(QnABoard qnaboard,AbsBoardFile file);
	
	Map<String, Object> absBoardDetail(int absNo); //질문게시판 상세
	void absBoardDelete(int absNo);
	
	void absComplete(int absNo);
	
	void uploadFile(AbsBoardFile file);

	void updateAbsBoard(QnABoard qnaboard);
	QnABoard updateForm(int absNo);
	
	List<AbsComment> listComment(int absNo);

	List<AbsComment> writeComment(AbsComment comment);

	List<AbsComment> deleteComment(AbsComment comment);


	int like(int no); // 게시글 추천수
	
	int likeCount(AbsLikeVO likeVO); // 게시글 추천여부 확인
	void insertLike(AbsLikeVO likeVO); //게시글 추천
	void updateLike(int no); //게시글 총 추천수 증가
	void deleteLike(AbsLikeVO likeVO); //게시글 추천 취소
	void cancelLike(int no);  // 게시글 총 추천수 감소
}
