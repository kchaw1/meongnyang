package com.nmcat.point.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.nmcat.point.serivce.PointService;
import com.nmcat.repository.domain.GetToken;
import com.nmcat.repository.domain.PointPlus;
import com.nmcat.repository.domain.TokenResult;

@Controller
@RequestMapping("/point")
public class PointController {

	@Autowired
	PointService service;
	
	@RequestMapping("/buy.mn")
	@ResponseBody
	public void buyPoint(PointPlus plus) {
		System.out.println(plus);
		service.buyPoint(plus);
 	} // I'm port API 사용

//	private String getPaymentData(String impUid, String accessToken) {
//		Gson gson = new Gson();
//		String paymentsUrl = "https://api.iamport.kr/payments/";
//		String result ="";
//		
//		try {
//			URL url = new URL(paymentsUrl+impUid);
//			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
//			
//			conn.setRequestMethod("GET");
//			conn.setRequestProperty("X-ImpTokenHeader", accessToken);
//			
//			//응답..
//			BufferedReader br = new BufferedReader(
//					new InputStreamReader(conn.getInputStream(), "utf-8"));
//			while(true) {
//				String line = br.readLine();
//				if(line==null) break;
//				
//				result +=line;
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println("결제정보 조회 : "+ result);
//		return result;
//	} // getPaymentData
//
//	private String getToken() {
//		String RESTApiKey = "4474300604317792";
//		String RESTApiSecret = "NqorYFYn9JNuLRbPiuX5gRiLMhuhcvi0WGrUmpiv850UWcKfGHlXzEJlWdD8IV8ECzzYZRu8Xv2UHMao";
//		GetToken getToken = new GetToken(RESTApiKey, RESTApiSecret); 
//		Gson gson = new Gson();
//		String keyObject = gson.toJson(getToken);
//		
//		String getTokenUrl = "https://api.iamport.kr/users/getToken";
//		String result = "";
//		
//		try {
//			URL url = new URL(getTokenUrl);
//			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
//			
//			conn.setRequestMethod("POST");
//			conn.setRequestProperty("Content-Type", "application/json");
//			
//			conn.setDoOutput(true);
//			
//			OutputStream out = conn.getOutputStream();
//			out.write(keyObject.getBytes("utf-8"));
//			out.flush();
//			out.close();
//			
//			//응답..
//			BufferedReader br = new BufferedReader(
//					new InputStreamReader(conn.getInputStream(), "utf-8"));
//			
//			while(true) {
//				String line = br.readLine();
//				if(line==null) break;
//				
//				result +=line;
//			}
//			System.out.println(result);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		TokenResult tr = gson.fromJson(result, TokenResult.class);
//		
//		return tr.getResponse().getAccess_token();
//	} //getToken
//	
//	
} //end class
