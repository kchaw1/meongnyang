package com.nmcat.abs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Abs;
import com.nmcat.repository.domain.AbsBoardFile;
import com.nmcat.repository.domain.AbsComment;
import com.nmcat.repository.domain.AbsLikeVO;
import com.nmcat.repository.domain.AbsPageResult;
import com.nmcat.repository.domain.AbsSearchVO;
import com.nmcat.repository.domain.ScoreHistory;
import com.nmcat.repository.domain.board.QnABoard;
import com.nmcat.repository.mapper.AbsMapper;
import com.nmcat.score.service.ScoreService;

@Service
public class AbsServiceImpl implements AbsService{

	@Autowired
	private AbsMapper absMapper;
	
	@Override
	public Map<String, Object> list(Abs abs) {
		
		Map<String,Object> map = new HashMap<>();
		List<Abs> abslist =  absMapper.selectAbsList(abs);
		System.out.println(abslist);
		 map.put("list", abslist);
		return map;	
	}

	@Override
	public Map<String, Object> detail(int no) {
		Map<String, Object> map = new HashMap<>();
		
		Abs detail = absMapper.selectAbsDetail(no);
		System.out.println(detail);

		map.put("b",detail);
		return map;
	}
	
	@Override
	public Map<String, Object> detailIntro(int no) {
		Map<String, Object> map = new HashMap<>();
		
		Abs detail = absMapper.selectAbsDetail(no);
		System.out.println(detail);
		map.put("b",detail);
		return map;
	}

	@Override
	public Map<String, Object> absboardlist(int no, int pageNo) {
		Map<String, Object> map = new HashMap<>();
		Abs detail = absMapper.selectAbsDetail(no);
		int count = absMapper.selectCntBoard();
		
		
		QnABoard board = new QnABoard();
		board.setPageNo(pageNo);
		board.setNo(no);
		
		
		System.out.println("패이지번호"+pageNo);
		List<QnABoard> list = absMapper.selectAbsBoard(no,board.getBegin());
		map.put("b", list);
		map.put("pageResult",  new AbsPageResult(pageNo, count));
		map.put("a",detail);
		return map;
		
	}

	@Override
	public Map<String, Object> write(QnABoard qnaboard,AbsBoardFile file,Abs abs, ScoreHistory scoreHistory, int no) {
		System.out.println(qnaboard);
		absMapper.insertAbsBoard(qnaboard);
		file.setAbsNo(qnaboard.getAbsNo());		
		absMapper.insertAbsBoardFile(file);
		
		//포인트
		absMapper.pointUse(abs);
		
		//활동점수 추가
		absMapper.updateScore(abs);
		absMapper.insertScoreHis(scoreHistory);
		
		Map<String, Object> map = new HashMap<>();
		
		Abs detail = absMapper.selectAbsDetail(no);
		System.out.println(detail);

		map.put("b",detail);
		return map;
	
	
	}

	@Override
	public Map<String, Object> absBoardDetail(int absNo, int no) {
		absMapper.AbsBoardViewCnt(absNo);
		Map<String, Object> map = new HashMap<>();
		
		QnABoard board = absMapper.selectAbsBoardByNo(absNo);
	
		Abs detail = absMapper.selectAbsDetail(no);
		map.put("a", detail);
		map.put("b", board);
		
		
		return map;
	}

	//게시글 삭제
	@Override
	public void absBoardDelete(int absNo) {
		absMapper.AbsDeleteBoard(absNo);
	}

	@Override
	public void absComplete(int absNo) {

		absMapper.AbsBoardComplete(absNo);
	}

	@Override
	public void uploadFile(AbsBoardFile file) {
		absMapper.insertAbsBoardFile(file);
		
	}
	
	//게시글 수정
	@Override
	public void updateAbsBoard(QnABoard qnaboard) {

		absMapper.updateAbsBoard(qnaboard);
	}

	@Override
	public QnABoard updateForm(int absNo) {
		return absMapper.selectAbsBoardByNo(absNo);
	}

	//댓글 리스트 가져오기 
	@Override
	public List<AbsComment> listComment(int absNo) {
	
		return absMapper.selectCommentListByabsNo(absNo);
		
	}

	@Override
	public List<AbsComment> writeComment(AbsComment comment,Abs abs, ScoreHistory scoreHistory) {
		abs.setId(comment.getAbsWriter());
		scoreHistory.setId(comment.getAbsWriter());
		absMapper.insertComment(comment);
		absMapper.updateScoreComment(abs);
		absMapper.insertCommentScoreHis(scoreHistory);
		return absMapper.selectCommentListByabsNo(comment.getAbsNo());
	}

	@Override
	public List<AbsComment> deleteComment(AbsComment comment) {
		absMapper.deleteComment(comment.getAbscNo());
		return absMapper.selectCommentListByabsNo(comment.getAbsNo());
	}

	@Override
	public int like(int no) {
		return absMapper.like(no);
	}

	@Override
	public int likeCount(AbsLikeVO likeVO) {
		return absMapper.likeCount(likeVO);
	}

	@Override
	public void insertLike(AbsLikeVO likeVO) {

			absMapper.insertLike(likeVO);
	}

	@Override
	public void updateLike(int no) {

		absMapper.updateLike(no);
	}

	@Override
	public void deleteLike(AbsLikeVO likeVO) {

		absMapper.deleteLike(likeVO);
	}

	@Override
	public void cancelLike(int no) {

		absMapper.cancelLike(no);
	}

	
	// 검색
	@Override
	public Map<String, Object> AbsBoardSearch(AbsSearchVO absSearch,int no,int pageNo) {
		Map<String, Object> map = new HashMap<>();
		List<QnABoard> list = absMapper.selectAbsBoardSearch(absSearch);
		Abs detail = absMapper.selectAbsDetail(no);
//		int count = absMapper.selectCntBoard();
		int count = absMapper.selectCntBoardSearch(absSearch);

		map.put("pageResult2",  new AbsPageResult(pageNo, count));
		map.put("ca", list);
		map.put("a",detail);

		return map;
		
	}





}
