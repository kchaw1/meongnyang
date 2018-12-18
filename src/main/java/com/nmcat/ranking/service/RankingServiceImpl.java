package com.nmcat.ranking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Rank;
import com.nmcat.repository.mapper.RankingMapper;
@Service
public class RankingServiceImpl implements RankingService  {
	 @Autowired
	 private RankingMapper mapper;
 
	@Override
	public List<Rank> selectGeneralMemberRank(Rank rank) {
		
		return mapper.selectGeneralMemberRank(rank);
	}

	@Override
	public List<Rank> selectABSMemberRank(Rank rank) {
		
		return mapper.selectABSMemberRank(rank);
	}

	@Override
	public List<Rank> selectAllMemberRank() {
		// TODO Auto-generated method stub
		return mapper.selectAllMemberRank();
	}

	
}
