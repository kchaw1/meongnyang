package com.nmcat.chat.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nmcat.repository.domain.Chat;
import com.nmcat.repository.mapper.ChatMapper;

@Controller
public class ChatController {

	 	@Autowired
	 	ChatMapper chatmapper;
	 	
	 	
	   @GetMapping("/chat/chat.mn")
	   public void chat() {
		   
	   }
	   @GetMapping("/chat/chatRoom.mn")
	   public Map<String, Object> chatRoom(Chat chat,Model model) {
		   Map<String,Object> map =   chatmapper.chatRoomList(chat);
		  
		   model.addAttribute("list",map);
			return map;
	   }
}
