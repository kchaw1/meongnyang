package com.nmcat.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Notice;
import com.nmcat.repository.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper mapper;
	
	// 공지사항 작성
	@Override
	public void writeNotice(Notice notice) {
		mapper.insertNotice(notice);
	}
	
	// 공지사항 리스트
	@Override
	public List<Notice> list(Notice notice) {
		return mapper.selectNoticeList(notice);
	}
	
	// 공지사항 개수
	@Override
	public int listCount() {
		return mapper.selectNoticeCount();
	}
}
