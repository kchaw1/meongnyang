package com.nmcat.diary.service;

import java.util.List;
import java.util.Map;

import com.nmcat.repository.domain.board.DiaryBoard;

public interface DiaryService {

	int writeNewDiary(DiaryBoard diary);

	Map<String, Object> list(String yearmonth);

	List<DiaryBoard> detailDiary(String date);

	Map<String, Object> deleteDiary(DiaryBoard diary);

	DiaryBoard updateformDiary(int drNo);

	List<DiaryBoard> updateDiary(DiaryBoard diary);



}
