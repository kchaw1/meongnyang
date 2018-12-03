package com.nmcat.msg.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nmcat.common.PageResult;
import com.nmcat.msg.service.MessageService;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.Message;
import com.nmcat.repository.domain.Page;

@Controller
@RequestMapping("/msg")
public class MessageController {
	
	@Autowired
	private MessageService service;
	
	//받은 쪽지함
	@RequestMapping("msgrecv.mn")
	@ResponseBody
	public List<Message> msgrecvlist(Model model, HttpSession session) {
		/*Page page = new Page();
		page.setPageNo(pageNo);*/
		// 세션을 받아와서 세션을 꺼내는데 멤버로 형변환을 해줘야 한다.
		Member member = (Member)session.getAttribute("user");
		/*	System.out.println(service.recvlist(member.getId()));*/
		model.addAttribute("msgrecvlist", service.recvlist(member.getId()));
		/*model.addAttribute("msgrecvlist", service.recvlist(member.getId(), page));*/
		return service.recvlist(member.getId());
	}
	
	/*보낸 쪽지함*/
	@RequestMapping("msgsend.mn")
	public String msgsendlist(Model model, HttpSession session) {
		// 세션을 받아와서 세션을 꺼내는데 멤버로 형변환을 해줘야 한다.
		Member member = (Member)session.getAttribute("user");

		model.addAttribute("msgsendlist", service.sendlist(member.getId()));
		model.addAttribute("msgrecvlist", service.recvlist(member.getId()));
		return "msg/msg";
	}
	
	/*쪽지쓰기 "<c:url value='/msg/msg.mn'/>"*/
	@RequestMapping("msgwrite.mn")
	public String msgwrite(Message msg) {
		service.writer(msg);
		return "redirect:/msg/msgsend.mn";
	}
	
	// 쪽지 삭제
	@RequestMapping("msgdelete.mn")
	public String msgdelete(int no) {
		service.deleteMsg(no);
		return "msg/msg";
	}
	
	@RequestMapping("detailmsg.mn")
	public void detail(int no, Model model) {
		model.addAttribute("msg", service.detail(no));
	}
}
