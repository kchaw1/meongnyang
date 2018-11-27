package com.nmcat.abs.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.abs.service.AbsService;
import com.nmcat.repository.domain.Abs;
import com.nmcat.repository.domain.board.QnABoard;

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
	//행동전문가 팝업창 메인
	@RequestMapping("/absDetailMain.mn")
	public void detail(int no, Model model) throws Exception {
		
		model.addAttribute("map", absService.detail(no));
		
	}
	//행동전문가 팝업창 상세
	@RequestMapping("/absDetail.mn")
	public void detailIntro(int no, Model model) {

		model.addAttribute("map", absService.detail(no));
	}
	
	//행동전문가 질문게시판 
	@RequestMapping("/absDetailBoard.mn")
	public void absboardlist(int no, Model model) {
		Map<String,Object> map = absService.absboardlist(no);
		model.addAttribute("map",map);
	}
	//행동전문가 질문게시판 질문 등록
	@RequestMapping("/write.mn")
	public String write(QnABoard qnaboard)throws Exception {
		System.out.println(qnaboard.getAbsTitle());
		qnaboard.setAbsWriter("victory");
		absService.write(qnaboard);
		return "redirect:absDetailBoard.mn?no="+qnaboard.getNo();

	}
	//행동전문가 질문게시판 질문 등록 폼
	@RequestMapping("/absDetailBoardWrite.mn")
	public void absBoardwriteForm(){
		
	}
	
	//행동전문가 질문게시판 질문 상세
	@RequestMapping("/absDetailBoardDetail.mn")
	public void absDetailBoardDetail(int absNo, Model model) {
		model.addAttribute("map", absService.absBoardDetail(absNo));
	}
	
}
