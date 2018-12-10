package com.nmcat.diary.service;

import java.util.List;
import java.util.Map;

import com.nmcat.repository.domain.board.DiaryBoard;
import com.nmcat.repository.domain.board.DiaryFile;

public interface DiaryService {

	Map<String, Object> writeNewDiary(DiaryBoard diary);

	Map<String, Object> list(DiaryBoard diary);

	List<DiaryBoard> detailDiary(DiaryBoard diary);

	Map<String, Object> deleteDiary(DiaryBoard diary);

	DiaryBoard updateformDiary(int drNo);

	List<DiaryBoard> updateDiary(DiaryBoard diary);

	Map<String, Object> writeAllNewDiary(DiaryBoard diary, DiaryFile file);

	List<DiaryBoard> listShareDiary(int begin);

	Map<String, Object> showDetailDiary(int drNo);



}
