package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Rank;

public interface RankingMapper {
	//ÀÒ¹ÝÈ¸¿ø·©Å·
	List<Rank> selectGeneralMemberRank(Rank rank);
	//Àü¹®°¡ ·©Å·
	List<Rank> selectABSMemberRank(Rank rank);
	List<Rank> selectAllMemberRank();

}
