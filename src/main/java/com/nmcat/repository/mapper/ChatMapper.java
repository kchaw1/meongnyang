package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Chat;

public interface ChatMapper {
	
	//채팅방 목록 가져오기
	List<Chat> chatRoomList(Chat chat);
	
	//채팅방 생성
	void chatRoomAdd(Chat chat);
	
	void chatRoomDelete(Chat chat);
}
