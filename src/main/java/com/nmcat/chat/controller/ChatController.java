package com.nmcat.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nmcat.repository.domain.Member;

@Controller
public class ChatController {

	   @GetMapping("/chat/chat.mn")
	   public void chat(Model model) {
		   Member member = new Member();
		   member.setId(member.getId());
		   
		   System.out.println("???????"+member);
		   model.addAttribute("ch", member);
		   
	   }
}
