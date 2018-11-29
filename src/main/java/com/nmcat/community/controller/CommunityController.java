package com.nmcat.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.nmcat.community.service.CommunityService;
import com.nmcat.repository.domain.CommunityComment;
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
	
/*	public void list(Model model, @RequestParam(value="pageNo", defaultValue="1")int pageNo)throws Exception{
		CommunityBoard comBoard = new CommunityBoard();
		comBoard.setPageNo(pageNo);
		
		model.addAttribute("list", service.selectBoard(comBoard));
	}*/
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
	@RequestMapping("/delete.mn")
	public String delete(int comNo)throws Exception{
		service.deleteBoard(comNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "communityPage.mn";
	}
	
	//-----------------------------------------
	//댓글 CRUD
	
	@RequestMapping("/selectComment.mn")
	@ResponseBody
	public List<CommunityComment> selectComment(int comNo)throws Exception{
		return service.selectComment(comNo);
	}
	
	@RequestMapping("/deleteComment.mn")
	@ResponseBody
	public void deleteComment(int comcNo)throws Exception{
		service.deleteComment(comcNo);
		
	}
	
	@RequestMapping("/insertComment.mn")
	@ResponseBody
	public void insertComment(CommunityComment comComment)throws Exception{
		service.insertComment(comComment);
	}
	
	@RequestMapping("/updateComment.mn")
	@ResponseBody
	public void updateComment(CommunityComment comComment)throws Exception{
		service.updateComment(comComment);
	}
	//댓글 총 갯수
	@RequestMapping("/updateComment.mn")
	@ResponseBody
	public int selectCommentCount(int comNo)throws Exception{
		return service.selectCommentCount(comNo);
		
	}
	
	
	
	
	
	
}
