package com.nmcat.msg.service;

import java.util.List;

import com.nmcat.repository.domain.Message;

public interface MessageService {
	
	List<Message> list();
	void writer(Message msg);
}
