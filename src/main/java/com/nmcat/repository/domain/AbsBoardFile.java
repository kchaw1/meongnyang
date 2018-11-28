package com.nmcat.repository.domain;

public class AbsBoardFile {
	private int absNo;
	private String absfSysName;
	private String absfPath;
	private String url;
	

	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getAbsNo() {
		return absNo;
	}
	public void setAbsNo(int absNo) {
		this.absNo = absNo;
	}
	public String getAbsfSysName() {
		return absfSysName;
	}
	public void setAbsfSysName(String absfSysName) {
		this.absfSysName = absfSysName;
	}
	public String getAbsfPath() {
		return absfPath;
	}
	public void setAbsfPath(String absfPath) {
		this.absfPath = absfPath;
	}

	
}
