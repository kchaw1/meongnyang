package com.nmcat.community.service;

import java.util.List;

import com.nmcat.repository.domain.ComSearchVO;
import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.CommunityFile;
import com.nmcat.repository.domain.CommunityReComment;
import com.nmcat.repository.domain.CommunityRef;
import com.nmcat.repository.domain.board.CommunityBoard;

public interface CommunityService {
		// 寃뚯떆�뙋 CRUD
	    //而ㅻ�ㅻ땲�떚 臾댄븳�뒪�겕濡� �쟾泥댁뭅�뀒怨좊━紐⑸줉 媛��졇�삤湲� +�럹�씠吏� 
		List<CommunityBoard> selectBoard(CommunityBoard comBoard);
		//而ㅻ�ㅻ땲�떚 臾댄븳�뒪�겕濡� �쟾泥댁뭅�뀒怨좊━紐⑸줉 媛��졇�삤湲� +移댄뀒怨좊━
		List<CommunityBoard> selectBoardCa(CommunityBoard comBoard);
		
		List<CommunityBoard> selectBoardC(CommunityBoard comBoard);
		
		List<CommunityBoard> selectGa();
		
		
		
		
	
		//�쟾泥대낫湲� - �럹�씠吏뺤쓣�쐞�븿!(pageNo瑜� 諛쏆븘�빞�빐�꽌 CommunityBoard瑜� 留ㅺ컻蹂��닔濡�)
		//List<CommunityBoard> selectBoard(CommunityBoard comBoard, );
		CommunityBoard detailBoard(int comNo);
		void insertBoard(CommunityBoard comBoard, CommunityFile file);
		void deleteBoard(int comNo);
		void updateBoard(CommunityBoard comBoard);
	
		int selectBoardCount();
		void insertBoardFile(CommunityFile file);
	
		
		// �뙎湲� CRUD
		List<CommunityComment> selectComment(int comNo);
		void insertComment(CommunityComment comComment);
		void deleteComment(int comcNo);
		void updateComment(CommunityComment comComment);
		
		int selectCommentCount(int comNo);
		//���뙎湲� CRUD
		List<CommunityReComment> selectReComment(int comcNo);
		void insertReComment(CommunityReComment comReComment);
		void deleteReComment(int comcReNo);
		void updateReComment(CommunityReComment comReComment);
		//異붿쿇
		int selectRefCnt(int comNo);
		void insertRef(CommunityRef comRef);
		void deleteRef(CommunityRef comRef);
		int checkRef(CommunityRef comRef);
		

}
