package com.nmcat.repository.domain;

public class AbsSearchVO {

	private String searchType;
	private String keyword;
	private int pageNo;
	private int no;
	private int begin;
	
	
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getBegin() {
		return (pageNo - 1) * 10;
	}

	public String getsearchType() {
		return searchType;
	}

	public void setsearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	@Override
	public String toString() {
		return "SearchVO [serchType=" + searchType + ", keyword=" + keyword + ", pageNo=" + pageNo + "]";
	}
	
	
}
