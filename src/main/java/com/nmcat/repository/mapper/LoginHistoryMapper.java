package com.nmcat.repository.mapper;

import com.nmcat.repository.domain.LoginHistory;

public interface LoginHistoryMapper {
	void insertHistory(String loginId);
	void updateHistory(String loginId);
	int selectHistory(String loginId);
}
