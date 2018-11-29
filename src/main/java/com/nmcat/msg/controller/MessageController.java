package com.nmcat.msg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.msg.service.MessageService;
import com.nmcat.repository.domain.Message;

@Controller
@RequestMapping("/msg")
public class MessageController {
	
	@Autowired
	private MessageService service;
	
	// 
	@RequestMapping("msg.mn")
	public void msglist(Model model) {
		model.addAttribute("msglist", service.list());
	}
	
	/*쪽지쓰기*/
	@RequestMapping("msgwrite.mn")
	public String msgwrite(Message msg) {
		service.writer(msg);
		return "redirect:/msg/msg.mn";
	}
}
