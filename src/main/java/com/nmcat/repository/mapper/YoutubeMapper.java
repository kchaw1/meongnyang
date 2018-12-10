package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Youtube;

public interface YoutubeMapper {
	
	void insertKeyword(Youtube ytb); // 키워드 추가
	void deleteKeyword(String keyword); // 키워드 제거
	List<Youtube> selectKeywordList(); // 키워드 가져오기
}
