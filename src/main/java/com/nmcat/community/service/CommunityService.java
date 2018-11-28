package com.nmcat.community.service;

import java.util.List;

import com.nmcat.repository.domain.board.CommunityBoard;

public interface CommunityService {
		//Ŀ�´�Ƽ CRUD
		//Ŀ�´�Ƽ ���ѽ�ũ�� ��ü��� ��������
		List<CommunityBoard> selectBoard();
	/*	List<CommunityBoard> selectBoard(CommunityBoard comBoard);*/
		
		//�󼼺���
		CommunityBoard detailBoard(int comNo);
		
		//Ŀ�´�Ƽ �� ���
		void insertBoard(CommunityBoard comBoard);
		
		//Ŀ�´�Ƽ �� ����
		void deleteBoard(int comNo);
		
		//Ŀ�´�Ƽ �� ����
		void updateBoard(CommunityBoard comBoard);
		
		// Ŀ�´�Ƽ ��ü �� ����
		int selectBoardCount();
		

}
