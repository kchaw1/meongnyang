package com.nmcat.diary.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.board.DiaryBoard;
import com.nmcat.repository.domain.board.DiaryComment;
import com.nmcat.repository.domain.board.DiaryFile;
import com.nmcat.repository.mapper.DiaryMapper;
import com.nmcat.repository.mapper.MemberMapper;

@Service
public class DiaryServiceImpl implements DiaryService{

	@Autowired
	private DiaryMapper mapper;
	
	@Autowired
	private MemberMapper membermapper;
	
	@Override
	public Map<String, Object> writeNewDiary(DiaryBoard diary) {
		mapper.insertDiary(diary);
		return list(diary);
	}

	@Override
	public Map<String, Object> list(DiaryBoard diary) {
		Map<String, Object> map = new HashMap<>();
		List<DiaryBoard> drList = mapper.selectAllDiaryByOneMonth(diary);
		map.put("drList", drList);
		//		 System.out.println("drList : " + drList);
		//		 System.out.println(drList.size());
		for(int i=0; i < drList.size(); i++) {
			if(i>0) {
				if(drList.get(i).getDrDate()
						.equals(drList.get(i-1).getDrDate())) continue;			 
			} 
			//System.out.println("drDate(i) : " + drList.get(i).getDrDate());
			diary.setDrDate(drList.get(i).getDrDate());
			int count = mapper.selectCntByOnedate(diary);
			//System.out.println("count: " + count);
			map.put(drList.get(i).getDrDate(), count);
		} //for
	
	return map;
	}

	@Override
	public Map<String, Object> detailDiary(DiaryBoard diary) {
		Map<String, Object> map = new HashMap<>();
		map.put("diaryList", mapper.selectDiarysByOnedate(diary));
		List<Integer> drNoList = mapper.selectDrNoByOnedate(diary);
		if(drNoList.size() != 0) {
			DiaryComment comment = new DiaryComment();
			comment.setDrNoList(drNoList);
			comment.setUserId(diary.getUserId());
			map.put("commentList", mapper.selectCommentsByOneDate(comment));
			for(int drNo : drNoList) {
				map.put(String.valueOf(drNo), mapper.selectCommentCntbydrNo(drNo));
			}
		}
		return map;
	}

	@Override
	public Map<String, Object> deleteDiary(DiaryBoard diary) {
		mapper.deleteDiary(diary.getDrNo());
		Map<String, Object> map = detailDiary(diary);
		List<DiaryBoard> drList = mapper.selectAllDiaryByOneMonth(diary);
		map.put("drList", drList);
		for(int i=0; i < drList.size(); i++) {
			if(i>0) {
				if(drList.get(i).getDrDate()
						.equals(drList.get(i-1).getDrDate())) continue;			 
			} 
			//System.out.println("drDate(i) : " + drList.get(i).getDrDate());
			diary.setDrDate(drList.get(i).getDrDate());
			int count = mapper.selectCntByOnedate(diary);
			//System.out.println("count: " + count);
			map.put(drList.get(i).getDrDate(), count);
		} //for
		
		return map;
	} //deleteDiary

	@Override
	public DiaryBoard updateformDiary(int drNo) {
		return mapper.selectOneDiaryBydrNo(drNo);
	}

	@Override
	public List<DiaryBoard> updateDiary(DiaryBoard diary) {
		mapper.updateDiary(diary);
		return mapper.selectDiarysByOnedate(diary);
	}

	@Override
	public Map<String, Object> writeAllNewDiary(DiaryBoard diary, DiaryFile file) {
		mapper.insertDiary(diary);
		System.out.println("drNo : "+diary.getDrNo());
		file.setDrNo(diary.getDrNo());
		mapper.insertNewFile(file);
		return list(diary);
	}

	@Override
	public List<DiaryBoard> listShareDiary(int begin) {
		System.out.println("list" + mapper.selectShareDiaryByPaging(begin));
		return mapper.selectShareDiaryByPaging(begin);
	}

	@Override
	public Map<String, Object> showDetailShareDiary(DiaryComment comment) {
		Map<String, Object> map = new HashMap<>();
		map.put("diary", mapper.selectOneDiaryBydrNo(comment.getDrNo()));
		map.put("comment", mapper.selectCommentByDrNo(comment));
		return map;
	}

	@Override
	public List<DiaryBoard> listShareAndFriendDiary(DiaryBoard diary) {
		System.out.println("list2" + mapper.selectShareAndFriendDiaryByPaging(diary));
		return mapper.selectShareAndFriendDiaryByPaging(diary);
	}

	@Override
	public Map<String, Object> pagePlusDiary(DiaryBoard diary) {
		Map<String, Object> map = new HashMap<>();
		map.put("list1", listShareDiary(diary.getBegin()));
		map.put("list2", listShareAndFriendDiary(diary));
		return map;
	}

	@Override
	public Map<String, Object> writeNewComment(DiaryBoard diary, DiaryComment comment) {
		//Map<String, Object> map = new HashMap<>();
		comment.setDrcRegDate(new Date());
		mapper.insertDiaryComment(comment);
		return detailDiary(diary);
	}

	@Override
	public void writeCommentShareDiary(DiaryComment comment) {
		comment.setDrcRegDate(new Date());
		mapper.insertDiaryComment(comment);
	}

	@Override
	public Member showImage(String id) {
		return membermapper.selectMemberInfoById(id);
	}

	
} // service
