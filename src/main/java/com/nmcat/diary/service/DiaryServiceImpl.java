package com.nmcat.diary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.board.DiaryBoard;
import com.nmcat.repository.mapper.DiaryMapper;

@Service
public class DiaryServiceImpl implements DiaryService{

	@Autowired
	private DiaryMapper mapper;
	
	@Override
	public int writeNewDiary(DiaryBoard diary) {
		return mapper.insertDiary(diary);
	}

	@Override
	public Map<String, Object> list(String yearmonth) {
		Map<String, Object> map = new HashMap<>();
		List<DiaryBoard> drList = mapper.selectAllDiaryByOneMonth(yearmonth);
		map.put("list", drList);
		//		 System.out.println("drList : " + drList);
		//		 System.out.println(drList.size());
		for(int i=0; i < drList.size(); i++) {
			if(i>0) {
				if(drList.get(i).getDrDate()
						.equals(drList.get(i-1).getDrDate())) continue;			 
			} 
			//System.out.println("drDate(i) : " + drList.get(i).getDrDate());
			int count = mapper.selectCntByOnedate(drList.get(i).getDrDate());
			//System.out.println("count: " + count);
			map.put(drList.get(i).getDrDate(), count);
		} //for
	
	return map;
	}

	@Override
	public List<DiaryBoard> detailDiary(String date) {
		return mapper.selectDiarysByOnedate(date);
	}

	@Override
	public Map<String, Object> deleteDiary(DiaryBoard diary) {
		Map<String, Object> map = new HashMap<>();
		mapper.deleteDiary(diary.getDrNo());
		List<DiaryBoard> detailList =  detailDiary(diary.getDrDate());
		List<DiaryBoard> drList = mapper.selectAllDiaryByOneMonth(diary.getDrDate().substring(0,6));
		map.put("list", detailList);
		//		 System.out.println("drList : " + drList);
		//		 System.out.println(drList.size());
		for(int i=0; i < drList.size(); i++) {
			if(i>0) {
				if(drList.get(i).getDrDate()
						.equals(drList.get(i-1).getDrDate())) continue;			 
			} 
			//System.out.println("drDate(i) : " + drList.get(i).getDrDate());
			int count = mapper.selectCntByOnedate(drList.get(i).getDrDate());
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
		return detailDiary(diary.getDrDate());
	}

	
} // service
