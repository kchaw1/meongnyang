package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Message;

public interface MessageMapper {
	
	List<Message>selectRecvMsglist();
	void insertMsg(Message msg);
}
