package com.nmcat.abs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Abs;
import com.nmcat.repository.domain.AbsBoardFile;
import com.nmcat.repository.domain.board.QnABoard;
import com.nmcat.repository.mapper.AbsMapper;

@Service
public class AbsServiceImpl implements AbsService{

	@Autowired
	private AbsMapper absMapper;
	
	@Override
	public Map<String, Object> list(Abs abs) {
		
		Map<String,Object> map = new HashMap<>();
		List<Abs> abslist =  absMapper.selectAbsList(abs);
		System.out.println(abslist);
		 map.put("list", abslist);
		return map;	
	}

	@Override
	public Map<String, Object> detail(int no) {
		Map<String, Object> map = new HashMap<>();
		
		Abs detail = absMapper.selectAbsDetail(no);
		System.out.println(detail);

		map.put("b",detail);
		return map;
	}
	
	@Override
	public Map<String, Object> detailIntro(int no) {
		Map<String, Object> map = new HashMap<>();
		
		Abs detail = absMapper.selectAbsDetail(no);
		System.out.println(detail);
		map.put("b",detail);
		return map;
	}

	@Override
	public Map<String, Object> absboardlist(int no) {
		Map<String, Object> map = new HashMap<>();

		System.out.println(no);
		List<QnABoard> list = absMapper.selectAbsBoard(no);
		Abs detail = absMapper.selectAbsDetail(no);
		map.put("b", list);
		map.put("a",detail);
		return map;
		
	}

	@Override
	public void write(QnABoard qnaboard,AbsBoardFile file) {
		System.out.println(qnaboard);
		absMapper.insertAbsBoard(qnaboard);
		file.setAbsNo(qnaboard.getAbsNo());
		
		absMapper.insertAbsBoardFile(file);
		
	}

	@Override
	public Map<String, Object> absBoardDetail(int absNo) {
		absMapper.AbsBoardViewCnt(absNo);
		Map<String, Object> map = new HashMap<>();
		
		QnABoard board = absMapper.selectAbsBoardByNo(absNo);
	
		map.put("b", board);
		
		
		return map;
	}

	@Override
	public void absBoardDelete(int absNo) {
		absMapper.AbsDeleteBoard(absNo);
	}

	@Override
	public void absComplete(int absNo) {

		absMapper.AbsBoardComplete(absNo);
	}

	@Override
	public void uploadFile(AbsBoardFile file) {
		absMapper.insertAbsBoardFile(file);
		
	}





}
