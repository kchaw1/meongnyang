package com.nmcat.msg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Message;
import com.nmcat.repository.domain.Page;
import com.nmcat.repository.mapper.MessageMapper;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageMapper mapper;
	
	@Override
	public void writer(Message msg) {
		mapper.insertMsg(msg);
	}

	@Override
	public List<Message> sendlist(String id) {
		return mapper.selectSendMsglist(id);
	}

	@Override
	public void deleteMsg(int no) {
		mapper.deleteMsg(no);
	}

	@Override
	public Message detail(int no) {
		return mapper.selectMsgDetail(no);
	}

	@Override
	public List<Message> recvlist(String id) {
		return mapper.selectRecvMsglist(id);
	}

	@Override
	public int count() {
		return mapper.selectRecvCount();
	}


}
