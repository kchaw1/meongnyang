package com.nmcat.youtube.service;

import java.util.List;

import com.nmcat.repository.domain.Youtube;

public interface YoutubeService {
	
	void addKeyword(Youtube ytb); // 키워드 추가
	void removeKeyword(String keyword); //키워드 제거
	List<Youtube> keywordList(); // 키워드 가져오기
}
