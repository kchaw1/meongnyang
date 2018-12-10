package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Message;
import com.nmcat.repository.domain.Page;

public interface MessageMapper {
	
	List<Message>selectRecvMsglist(String id); // 받은 쪽지함
	List<Message>selectSendMsglist(String id); // 보낸 쪽지함
	void insertMsg(Message msg); // 쪽지 쓰기
	int deleteMsg(int no); // 게시물 삭제
	Message selectMsgDetail(int no); // 쪽지 상세
	int selectRecvCount();
	
}
