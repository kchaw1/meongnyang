package com.nmcat.community.service;

import java.util.List;

import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.CommunityFile;
import com.nmcat.repository.domain.CommunityReComment;
import com.nmcat.repository.domain.CommunityRef;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.board.CommunityBoard;

public interface CommunityService {
		// 野껊슣�뻻占쎈솇 CRUD
	    //�뚣끇占썬끇�빍占쎈뼒 �눧�똾釉놂옙�뮞占쎄쾿嚥∽옙 占쎌읈筌ｋ똻萸낉옙�믤�⑥쥓�봺筌뤴뫖以� 揶쏉옙占쎌죬占쎌궎疫뀐옙 +占쎈읂占쎌뵠筌욑옙 
		List<CommunityBoard> selectBoard(CommunityBoard comBoard);
		//�뚣끇占썬끇�빍占쎈뼒 �눧�똾釉놂옙�뮞占쎄쾿嚥∽옙 占쎌읈筌ｋ똻萸낉옙�믤�⑥쥓�봺筌뤴뫖以� 揶쏉옙占쎌죬占쎌궎疫뀐옙 +燁삳똾�믤�⑥쥓�봺
		List<CommunityBoard> selectBoardCa(CommunityBoard comBoard);
		
		List<CommunityBoard> selectBoardC(CommunityBoard comBoard);
		
		List<CommunityBoard> selectGa();
		List<CommunityBoard> selectGaToWriter(CommunityBoard comBoard);
		Member selectProfile(String id);
		
		
		
		
	
		//占쎌읈筌ｋ��궖疫뀐옙 - 占쎈읂占쎌뵠筌욌벡�뱽占쎌맄占쎈맙!(pageNo�몴占� 獄쏆룇釉섓옙鍮욑옙鍮먲옙苑� CommunityBoard�몴占� 筌띲끆而삭퉪占쏙옙�땾嚥∽옙)
		//List<CommunityBoard> selectBoard(CommunityBoard comBoard, );
		CommunityBoard detailBoard(int comNo);
		void insertBoard(CommunityBoard comBoard, CommunityFile file);
		void deleteBoard(int comNo);
		void updateBoard(CommunityBoard comBoard);
	
		int selectBoardCount();
		void insertBoardFile(CommunityFile file);
	
		
		// 占쎈솊疫뀐옙 CRUD
		List<CommunityComment> selectComment(int comNo);
		void insertComment(CommunityComment comComment);
		void deleteComment(int comcNo);
		void updateComment(CommunityComment comComment);
		
		int selectCommentCount(int comNo);
		//占쏙옙占쎈솊疫뀐옙 CRUD
		List<CommunityReComment> selectReComment(int comcNo);
		void insertReComment(CommunityReComment comReComment);
		void deleteReComment(int comcReNo);
		void updateReComment(CommunityReComment comReComment);
		//�빊遺우퓝
		int selectRefCnt(int comNo);
		void insertRef(CommunityRef comRef);
		void deleteRef(CommunityRef comRef);
		int checkRef(CommunityRef comRef);
		

}
