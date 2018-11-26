package com.nmcat.diary.service;

import java.util.List;
import java.util.Map;

import com.nmcat.repository.domain.board.DiaryBoard;

public interface DiaryService {

	int writeNewDiary(DiaryBoard diary);

	Map<String, Integer> list(String yearmonth);

}
