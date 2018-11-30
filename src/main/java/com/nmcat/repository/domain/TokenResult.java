package com.nmcat.repository.domain;

import lombok.Data;

@Data
public class TokenResult {

	int code;
	String message;
	APIResponse response;
} // 
