package com.nmcat.msg.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.msg.service.MessageService;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.Message;

@Controller
@RequestMapping("/msg")
public class MessageController {
	
	@Autowired
	private MessageService service;
	
	// 
	@RequestMapping("msgrecv.mn")
	public String msgrecvlist(Model model, HttpSession session) {
		// 세션을 받아와서 세션을 꺼내는데 멤버로 형변환을 해줘야 한다.
		Member member = (Member)session.getAttribute("user");

		model.addAttribute("msglist", service.recvlist(member.getId()));
		return "msg/msg";
	}
	
	@RequestMapping("msgsend.mn")
	public String msgsendlist(Model model, HttpSession session) {
		// 세션을 받아와서 세션을 꺼내는데 멤버로 형변환을 해줘야 한다.
		Member member = (Member)session.getAttribute("user");

		model.addAttribute("msglist", service.sendlist(member.getId()));
		return "msg/msg";
	}
	
	/*쪽지쓰기 "<c:url value='/msg/msg.mn'/>"*/
	@RequestMapping("msgwrite.mn")
	public String msgwrite(Message msg) {
		service.writer(msg);
		return "redirect:/msg/msgsend.mn";
	}
	
	@RequestMapping("msgdelete.mn")
	public String msgdelete(int no) {
		service.deleteMsg(no);
		return "msg/msg";
	}
}
