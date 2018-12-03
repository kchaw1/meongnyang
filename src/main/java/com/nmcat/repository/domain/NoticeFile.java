package com.nmcat.repository.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeFile {
	private List<MultipartFile> attach;
	private int ntcfNo;
	private int ntcNo;
	private String ntcfWriter;
	private String ntcfOriName;
	private String ntcfSysName;
	private String ntcfPath;
	private long ntcfSize;
	private String url;
}
