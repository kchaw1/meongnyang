package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Blacklist;
import com.nmcat.repository.domain.Member;

public interface BlackListMapper {

	public void insertNewBlackList(Blacklist black);
	
	public List<String> selectBlackListIdByOneLine(Blacklist black);
	
	public List<Member> selectBlackInfoByIdList(Member m);
	
	public int selectBlackListCnt(String id);
}//end
