package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.board.DiaryBoard;
import com.nmcat.repository.domain.board.DiaryComment;
import com.nmcat.repository.domain.board.DiaryFile;

public interface DiaryMapper {

	public int insertDiary(DiaryBoard diary);
	
	public List<DiaryBoard> selectAllDiaryByOneMonth(DiaryBoard diary);
	
	public int selectCntByOnedate(DiaryBoard diary);
	
	public List<DiaryBoard> selectDiarysByOnedate(DiaryBoard diary);
	
	public void deleteDiary(int drNo);
	
	public DiaryBoard selectOneDiaryBydrNo(int drNo);
	
	public void updateDiary(DiaryBoard diary);
	
	public void insertNewFile(DiaryFile file);
	
	public List<DiaryBoard> selectShareDiaryByPaging(int begin);
	
	public List<DiaryBoard> selectShareAndFriendDiaryByPaging(DiaryBoard diary);
	
	public void insertDiaryComment(DiaryComment comment);
	
	public List<Integer> selectDrNoByOnedate(DiaryBoard diary);
	
	public List<DiaryComment> selectCommentsByOneDate(DiaryComment comment);
	
	public List<DiaryComment> selectCommentByDrNo(DiaryComment comment);
	
	public int selectCommentCntbydrNo(int drNo);
	
	public void deleteCommentByDrcNo(int drcNo);
} //end interface
