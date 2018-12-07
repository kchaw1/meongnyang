package com.nmcat.repository.domain.board;

import lombok.Data;

@Data
public class DiaryFile {

	private int drfNo;
	private int drNo;
	private String drfSysName;
	private String drfPath;
	//summernote에 사진 넣기 위해 선언하는 url;
	private String url;
}//end class
