package com.nmcat.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatController {

	   @GetMapping("/chat/chat.mn")
	   public void chat() {}
}
