package com.nmcat.abs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.abs.service.AbsService;

@RequestMapping("/abs")
@Controller
public class AbsController {

	@Autowired
	public AbsService absService;
	
	
	//행동전문가 리스트 가져오기
	@RequestMapping("/absList.mn")
	public void absmain(int type, Model model) throws Exception {
		
		model.addAttribute("map", absService.selectAbsList(type));
		
	}
}

