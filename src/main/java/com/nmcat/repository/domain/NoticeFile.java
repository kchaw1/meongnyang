package com.nmcat.repository.domain;

import lombok.Data;

@Data
public class NoticeFile {
	private int ntcfNo;
	private int ntcNo;
	private String ntcfWriter;
	private String ntcfOriName;
	private String ntcfSysName;
	private String ntcfPath;
	private long ntcfSize;
	private String url;
}
