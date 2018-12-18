package com.nmcat.ranking.service;

import java.util.List;

import com.nmcat.repository.domain.Rank;

public interface RankingService {
	List<Rank> selectGeneralMemberRank(Rank rank);
	List<Rank> selectABSMemberRank(Rank rank);
	List<Rank> selectAllMemberRank();
}
