package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Message;

public interface MessageMapper {
	
	List<Message>selectRecvMsglist(String id);
	List<Message>selectSendMsglist(String id);
	void insertMsg(Message msg);
	int deleteMsg(int no); // 게시물 삭제
}
