package com.nmcat.msg.service;

import java.util.List;

import com.nmcat.repository.domain.Message;
import com.nmcat.repository.domain.Page;

public interface MessageService {
	
	List<Message> recvlist(String id);
	List<Message> sendlist(String id);
	void writer(Message msg);
	void deleteMsg(int no);
	Message detail(int no);
	int count();
}
