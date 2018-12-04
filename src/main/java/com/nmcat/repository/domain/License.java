package com.nmcat.repository.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class License {
	private int licenseNo;
	private String id;
	private String lifSysName;
	private String lifPath;
	private String lifOriName;
	private int lifSize;
	private MultipartFile lifile;
}
