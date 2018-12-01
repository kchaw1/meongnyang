package com.nmcat.notice.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nmcat.common.PageResult;
import com.nmcat.notice.service.NoticeService;
import com.nmcat.repository.domain.Notice;

@RequestMapping("/admin")
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	// 공지사항 작성 폼 이동
	@RequestMapping("/notice/writeForm")
	public void writeForm() {}
	
	// 공지사항 작성
	@RequestMapping("/notice/write")
	public String write(Notice notice) {
		service.writeNotice(notice);
		return "redirect:list.mn";
	}
	
	@RequestMapping("notice/list") 
	public void list(){}
	
	// 공지사항 리스트 
	@RequestMapping("/notice/noticeList")
	@ResponseBody
	public Map<String, Object> noticeList(@RequestParam(value="pageNo", defaultValue="1") int pageNo) {
		Notice notice = new Notice();
		notice.setPageNo(pageNo);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("noticeList", service.list(notice));
		map.put("pageResult", new PageResult(pageNo, service.listCount()));
		
		return map;
	}
	

}
