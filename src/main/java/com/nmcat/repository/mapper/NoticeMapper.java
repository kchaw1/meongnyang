package com.nmcat.repository.mapper;

import java.util.List;	

import com.nmcat.repository.domain.Notice;
import com.nmcat.repository.domain.NoticeFile;

public interface NoticeMapper {
	
	void insertNotice(Notice notice); // 공지사항 작성
	void insertNoticeFile(NoticeFile noticeFile); // 사진첨부
	List<Notice> selectNoticeList(Notice notice); // 공지사항 리스트
	int selectNoticeCount(Notice notice); // 공지사항 개수
	Notice selectNoticeDetail(int ntcNo); // 공지사항 디테일
	void updateViewCnt(int ntcNo); // 조회수
	void deleteNotice(int ntcNo); // 삭제
	void updateNotice(Notice notice); // 수정
	List<NoticeFile> selectNoticeFile(int ntcNo); // 파일보여주기
}
