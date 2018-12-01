package com.nmcat.notice.service;

import java.util.List;

import com.nmcat.repository.domain.Notice;

public interface NoticeService {
	
	void writeNotice(Notice notice); // 공지사항 작성
	List<Notice> list(Notice notice); // 공지사항 리스트
	int listCount(); // 공지사항 개수

}
