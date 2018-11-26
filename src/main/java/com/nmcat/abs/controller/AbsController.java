package com.nmcat.abs.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.abs.service.AbsService;
import com.nmcat.repository.domain.Abs;

@RequestMapping("/abs")
@Controller
public class AbsController {

	@Autowired
	public AbsService absService;
	
	
	//행동전문가 리스트 가져오기
	@RequestMapping("/absList.mn")
	public void list(Abs abs, Model model) throws Exception {
		
		Map<String,Object> map =absService.list(abs);
		model.addAttribute("map", map);
		
	}
	@RequestMapping("/absDetailMain.mn")
	public void detail(int no, Model model) throws Exception {
		
		model.addAttribute("map", absService.detail(no));
		
	}
	@RequestMapping("/absDetail.mn")
	public void detailIntro(int no, Model model) {

		model.addAttribute("map", absService.detail(no));
	}
	
	@RequestMapping("/absDetailBoard.mn")
	public void absboardlist(int no, Model model) {
		Map<String,Object> map = absService.absboardlist(no);
		model.addAttribute("map",map);
	}
}
