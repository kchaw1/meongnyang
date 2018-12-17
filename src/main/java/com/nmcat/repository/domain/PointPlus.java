package com.nmcat.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PointPlus {

	int plusNo;
	String id;
	int plusPoint;
	Date plusDate;
	String plusType;
	String merchantUid;
	String impUid;
	
	// 페이지 번호
			private int pageNo;
			public int getPageNo() {
				return pageNo;
			}
			public void setPageNo(int pageNo) {
				this.pageNo = pageNo;
			}
			// #{begin} -> board.xml
			public int getBegin() {
				return (pageNo - 1) * 10;
			}
} //end class
