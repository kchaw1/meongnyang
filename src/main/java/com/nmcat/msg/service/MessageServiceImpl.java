package com.nmcat.msg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Message;
import com.nmcat.repository.mapper.MessageMapper;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageMapper mapper;
	
	@Override
	public List<Message> list() {
		return mapper.selectRecvMsglist();
	}

	@Override
	public void writer(Message msg) {
		mapper.insertMsg(msg);
	}

}