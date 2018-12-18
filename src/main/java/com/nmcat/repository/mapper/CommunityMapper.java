package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.CommunityFile;
import com.nmcat.repository.domain.CommunityReComment;
import com.nmcat.repository.domain.CommunityRef;
import com.nmcat.repository.domain.board.CommunityBoard;

public interface CommunityMapper {
	//而ㅻ�ㅻ땲�떚 臾댄븳�뒪�겕濡� �쟾泥댁뭅�뀒怨좊━紐⑸줉 媛��졇�삤湲� +�럹�씠吏�
	List<CommunityBoard> selectBoard(CommunityBoard comBoard);
	//而ㅻ�ㅻ땲�떚 臾댄븳�뒪�겕濡� �쟾泥댁뭅�뀒怨좊━ 紐⑸줉 媛��졇�삤湲� + 移댄뀒怨좊━
	List<CommunityBoard> selectBoardCa(CommunityBoard comBoard);
	// 媛ㅻ윭由� �뿰�뒿�슜
	List<CommunityBoard> selectGa();
	List<CommunityBoard> selectGaToWriter(CommunityBoard comBoard);
	
	//移댄뀒怨좊━
	List<CommunityBoard> selectBoardC(CommunityBoard comBoard);
	//而ㅻ�ㅻ땲�떚 臾댄븳�뒪�겕濡� �쟾泥댁뭅�뀒怨좊━紐⑸줉 媛��졇�삤湲� +�럹�씠吏�
	//List<CommunityBoard> selectBoard(CommunityBoard comBoard)
	//List<CommunityBoard> selectBoard();
	//�긽�꽭蹂닿린
	CommunityBoard detailBoard(int comNo);
	
	//而ㅻ�ㅻ땲�떚 湲� �벑濡�
	void insertBoard(CommunityBoard comBoard);
	
	//而ㅻ�ㅻ땲�떚 湲� �궘�젣
	void deleteBoard(int comNo);
	
	//而ㅻ�ㅻ땲�떚 湲� �닔�젙
	void updateBoard(CommunityBoard comBoard);
	
	// 而ㅻ�ㅻ땲�떚 �쟾泥� 湲� 媛��닔
	int selectBoardCount();
	int updateBoardViewCnt(int comNo);
	
	//�뙆�씪 �벑濡�
	void insertBoardFile(CommunityFile file);
	//�뙎湲� �쟾泥닿갗�닔
	int selectCommentCount(int comNo);
	
	//--------------------------------------------------------------------------------
	// �뙎湲� CRUD
	List<CommunityComment> selectComment(int comNo);
	void insertComment(CommunityComment comComment);
	void deleteComment(int comcNo);
	void updateComment(CommunityComment comComment);
	// ���뙎湲� CRUD
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
