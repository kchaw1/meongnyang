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
import com.nmcat.repository.domain.board.QnABoard;
import com.nmcat.repository.mapper.AbsMapper;

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
	public Map<String, Object> absboardlist(int no) {
		Map<String, Object> map = new HashMap<>();

		System.out.println(no);
		List<QnABoard> list = absMapper.selectAbsBoard(no);
		Abs detail = absMapper.selectAbsDetail(no);
		map.put("b", list);
		map.put("a",detail);
		return map;
		
	}

	@Override
	public void write(QnABoard qnaboard,AbsBoardFile file) {
		System.out.println(qnaboard);
		absMapper.insertAbsBoard(qnaboard);
		file.setAbsNo(qnaboard.getAbsNo());
		
		absMapper.insertAbsBoardFile(file);
		
	}

	@Override
	public Map<String, Object> absBoardDetail(int absNo) {
		absMapper.AbsBoardViewCnt(absNo);
		Map<String, Object> map = new HashMap<>();
		
		QnABoard board = absMapper.selectAbsBoardByNo(absNo);
	
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
	public List<AbsComment> writeComment(AbsComment comment) {
		absMapper.insertComment(comment);
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





}
