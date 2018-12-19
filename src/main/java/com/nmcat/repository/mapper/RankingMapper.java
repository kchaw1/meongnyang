package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Rank;

public interface RankingMapper {
	//�ҹ�ȸ����ŷ
	List<Rank> selectGeneralMemberRank(Rank rank);
	//������ ��ŷ
	List<Rank> selectABSMemberRank(Rank rank);
	List<Rank> selectAllMemberRank();

}
