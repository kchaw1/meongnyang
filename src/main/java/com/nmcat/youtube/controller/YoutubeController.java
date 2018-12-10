package com.nmcat.youtube.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nmcat.repository.domain.Youtube;
import com.nmcat.youtube.service.YoutubeService;

@RequestMapping("/admin")
@Controller
public class YoutubeController {

	@Autowired
	private YoutubeService service;
	
	// 유튜브 페이지 호출
	@RequestMapping("/youtube/youtube")
	public void youtube() {}
	
	// 키워드 추가
	@RequestMapping("/youtube/add-keyword") 
	@ResponseBody
	public void addKeywrod(Youtube ytb) {
		service.addKeyword(ytb);
	}
	
	// 키워드 제거
	@RequestMapping("/youtube/remove-keyword") 
	@ResponseBody
	public void removeKeywrod(String ytbKeyword) {
		service.removeKeyword(ytbKeyword);
	}
	
	// 키워드 목록
	@RequestMapping("/youtube/keywordList") 
	@ResponseBody
	public List<Youtube> removeKeywrod() {
		return service.keywordList();
	}
}
