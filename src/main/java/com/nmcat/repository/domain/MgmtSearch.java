package com.nmcat.repository.domain;

import lombok.Data;

@Data
public class MgmtSearch {
	private String searchType;
	private String keyword;
	private String authState;
	private String sortColumn; // 컬럼명
	private String sortMethod; // asc, desc
}
