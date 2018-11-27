package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.board.DiaryBoard;

public interface DiaryMapper {

	public int insertDiary(DiaryBoard diary);
	
	public List<DiaryBoard> selectAllDiaryByOneMonth(String yearmonth);
	
	public int selectCntByOnedate(String date);
	
	public List<DiaryBoard> selectDiarysByOnedate(String date);
	
	public void deleteDiary(int drNo);
	
	public DiaryBoard selectOneDiaryBydrNo(int drNo);
	
	public void updateDiary(DiaryBoard diary);
} //end interface
