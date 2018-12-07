package com.nmcat.diary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.board.DiaryBoard;
import com.nmcat.repository.domain.board.DiaryFile;
import com.nmcat.repository.mapper.DiaryMapper;

@Service
public class DiaryServiceImpl implements DiaryService{

	@Autowired
	private DiaryMapper mapper;
	
	@Override
	public Map<String, Object> writeNewDiary(DiaryBoard diary) {
		mapper.insertDiary(diary);
		return list(diary);
	}

	@Override
	public Map<String, Object> list(DiaryBoard diary) {
		Map<String, Object> map = new HashMap<>();
		List<DiaryBoard> drList = mapper.selectAllDiaryByOneMonth(diary);
		map.put("list", drList);
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
	public List<DiaryBoard> detailDiary(DiaryBoard diary) {
		return mapper.selectDiarysByOnedate(diary);
	}

	@Override
	public Map<String, Object> deleteDiary(DiaryBoard diary) {
		Map<String, Object> map = new HashMap<>();
		mapper.deleteDiary(diary.getDrNo());
		List<DiaryBoard> detailList =  detailDiary(diary);
		List<DiaryBoard> drList = mapper.selectAllDiaryByOneMonth(diary);
		map.put("list", detailList);
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
	} //deleteDiary

	@Override
	public DiaryBoard updateformDiary(int drNo) {
		return mapper.selectOneDiaryBydrNo(drNo);
	}

	@Override
	public List<DiaryBoard> updateDiary(DiaryBoard diary) {
		mapper.updateDiary(diary);
		return detailDiary(diary);
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

	
} // service
