package com.nmcat.youtube.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Youtube;
import com.nmcat.repository.mapper.YoutubeMapper;

@Service
public class YoutubeServiceImpl implements YoutubeService{

	@Autowired
	private YoutubeMapper mapper;
	
	// 키워드 추가
	@Override
	public void addKeyword(Youtube ytb) {
		mapper.insertKeyword(ytb);
	}
	
	// 키워드 제거
	@Override
	public void removeKeyword(String keyword) {
		mapper.deleteKeyword(keyword);
	}
	
	// 키워드 리스트
	@Override
	public List<Youtube> keywordList() {
		return mapper.selectKeywordList();
	}
	
}
