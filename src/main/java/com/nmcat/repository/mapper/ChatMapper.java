package com.nmcat.repository.mapper;

import java.util.List;
import java.util.Map;

import com.nmcat.repository.domain.Chat;

public interface ChatMapper {
	
	//채팅방 목록 가져오기
	Map<String, Object> chatRoomList(Chat chat);
	
	//채팅방 생성
	void chatRoomAdd(Chat chat);
	
}
