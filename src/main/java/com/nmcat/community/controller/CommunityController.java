package com.nmcat.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.nmcat.community.service.CommunityService;
import com.nmcat.repository.domain.board.CommunityBoard;

@Controller
@RequestMapping("/community")
public class CommunityController {

	@Autowired
	private CommunityService service;
	
	@RequestMapping("/communityPage.mn")
	public void list(Model model)throws Exception{
		model.addAttribute("list", service.selectBoard());
	}
	@RequestMapping("/detailPage.mn")
	public void detail(Model model, int comNo)throws Exception{
		model.addAttribute("communityBoard", service.detailBoard(comNo));
	}
	@RequestMapping("/writeForm.mn")
	public void writeForm() {
		
	}
	@RequestMapping("/write.mn")
	public String write(CommunityBoard comBoard)throws Exception{
		service.insertBoard(comBoard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "communityPage.mn";
	}
	@RequestMapping("/editWriteForm.mn")
	public void updateForm(int comNo, Model model)throws Exception{
		model.addAttribute("communityBoard", service.detailBoard(comNo));
	}
	@RequestMapping("/edit.mn")
	public String update(CommunityBoard comBoard)throws Exception{
		service.updateBoard(comBoard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "communityPage.mn";
	}
}
