package com.nmcat.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			Map<String,Object> map = new HashMap<>();
		   List<Chat> list =  chatmapper.chatRoomList(chat);
		  
		   map.put("list",list);
		   System.out.println("ㄴㅁㅇㅁㄴㅇ"+list);
		return map;
	   }
	   
	   @PostMapping("/chat/chatRoomAdd.mn")
	   @ResponseBody
	   public void chatRoomAdd(Chat chat) {
		   chatmapper.chatRoomAdd(chat);
//		return "/chat/chatRoom.mn";
	   }
	   @PostMapping("/chat/chatRoomDelete.mn")
	   @ResponseBody
	   public void chatRoomDelete(Chat chat) {
		   chatmapper.chatRoomDelete(chat);
//		return "/chat/chatRoom.mn";
	   }
}
