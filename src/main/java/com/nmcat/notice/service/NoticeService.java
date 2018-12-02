package com.nmcat.notice.service;

import java.util.List;	

import com.nmcat.repository.domain.Notice;
import com.nmcat.repository.domain.NoticeFile;

public interface NoticeService {
	
	void writeNotice(Notice notice, List<NoticeFile> fileList); // 공지사항 작성
	void noticeFile(NoticeFile noticeFile); // 공지사항 사진 첨부
	List<Notice> list(Notice notice); // 공지사항 리스트
	int listCount(Notice notice); // 공지사항 개수
	Notice detail(int ntcNo); // 공지사항 디테일
}
