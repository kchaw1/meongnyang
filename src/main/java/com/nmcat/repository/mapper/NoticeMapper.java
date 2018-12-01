package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Notice;

public interface NoticeMapper {
	
	void insertNotice(Notice notice); // 공지사항 작성
	List<Notice> selectNoticeList(Notice notice); // 공지사항 리스트
	int selectNoticeCount(); // 공지사항 개수
}
