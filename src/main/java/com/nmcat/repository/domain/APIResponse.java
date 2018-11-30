package com.nmcat.repository.domain;

import lombok.Data;

@Data
public class APIResponse {

	String access_token;
	int expired_at;
	int now;
	
	String imp_uid;
	String merchant_uid;
	String pay_method;
	String channel;
	String pg_provider;
	String pg_tid;
	String pg_id;
	boolean escrow;
	int card_quota;
	String name;
	int amount;
	int cancel_amount;
	String currency;
	String buyer_name;
	String buyer_email;
	String user_agent;
	int paid_at;
	String fail_reason;
	String receipt_url;
}
