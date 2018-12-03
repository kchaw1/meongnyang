package com.nmcat.notice.service;

import java.util.List;		

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nmcat.repository.domain.Notice;
import com.nmcat.repository.domain.NoticeFile;
import com.nmcat.repository.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper mapper;
	
	// 공지사항 작성
	@Override
	public void writeNotice(Notice notice, List<NoticeFile> fileList) {
		mapper.insertNotice(notice);
		if(fileList != null) {
			for(NoticeFile f : fileList) {
				noticeFile(f);
			}
		}		
	}
	
	// 사진 첨부
	@Override
	public void noticeFile(NoticeFile noticeFile) {
		mapper.insertNoticeFile(noticeFile);
	}
	
	// 공지사항 리스트
	@Override
	public List<Notice> list(Notice notice) {
		return mapper.selectNoticeList(notice);
	}
	
	// 공지사항 개수
	@Override
	public int listCount(Notice notice) {
		return mapper.selectNoticeCount(notice);
	}
	
	// 공지사항 디테일
	@Override
	public Notice detail(int ntcNo) {
		return mapper.selectNoticeDetail(ntcNo);
	}
	
	// 조회수
	@Override
	public void viewCnt(int ntcNo) {
		mapper.updateViewCnt(ntcNo);
	}
	
	// 삭제
	@Override
	public void delete(int ntcNo) {
		mapper.deleteNotice(ntcNo);
	}	
	
	// 수정
	@Override
	public void update(Notice notice) {
		mapper.updateNotice(notice);
	}
	
	// 첨부파일 보여주기
	@Override
	public List<NoticeFile> showFile(int ntcNo) {
		return mapper.selectNoticeFile(ntcNo);
	}
}
