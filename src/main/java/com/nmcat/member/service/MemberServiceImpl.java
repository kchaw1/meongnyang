package com.nmcat.member.service;

import java.util.List;
import java.util.Random;

import org.apache.commons.mail.HtmlEmail;
import org.apache.log4j.lf5.PassingLogRecordFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Career;
import com.nmcat.repository.domain.License;
import com.nmcat.repository.domain.Login;
import com.nmcat.repository.domain.LoginHistory;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.mapper.LoginHistoryMapper;
import com.nmcat.repository.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;
	@Autowired
	private LoginHistoryMapper lomapper;
	
	@Override
	public void signup(Member member) {
		mapper.insertNewMemberNofile(member);
	} // 회원가입

	@Override
	public Member login(Login login) {
		return mapper.selectMemeberIdandPass(login);
	}

	@Override
	public boolean checkId(String id) {
		System.out.println("id : " + id);
		String fId = mapper.selectId(id);
		boolean result = false;
		if(fId != null) {
				result = true;
		}
		return result;
		
	}

	@Override
	public String sendMail(Member member) {
		String charSet="utf-8";
		String hostSMTP="smtp.naver.com";
		String hostSMTPid="woro104";
		String hostSMTPpwd="dnlseh7";
		
		// 보내는 사람 Email, 제목, 내용
		String fromEmail="woro104@naver.com";
		String formName="nmcatProject";
		String subject="인증메일입니다.";
		String msg="인증번호를 입력하세요.";
		
		// 인증키 생성
		Random rd = new Random();
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<5; i++) {
			if(rd.nextBoolean()) {
				sb.append((char)((int)(rd.nextInt(26))+97));
			} else {
				sb.append((rd.nextInt(10)));
			}
		}
		
		// 내용
		subject = "nmcat 회원가입 인증 메일입니다.";
		msg += "<h3>인증번호는 : " + sb.toString() + "입니다.</h3>";
		
		// 받는사람 email 
		String mail = member.getEmail();
		
		// 메일발송
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);
			
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, formName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
		
		return sb.toString();
	}

	// 로그인 내역
	@Override
	public void insertHistory(String loginId) {
		lomapper.insertHistory(loginId);
		
	}
	
	// 로그인시 + 10
	@Override
	public void updqteScore(String id) {
		mapper.updateScore(id);
	}
	
	// 경력
	@Override
	public void insertCaree(Career career) {
		mapper.insertCaree(career);
		
	}
	
	// 행동전문가 회원가입
	@Override
	public void absup(Member member) {
		mapper.insertabsMemberfile(member);
		
	}
	
	// 자격증
	@Override
	public void license(License license) {
		mapper.insertLicense(license);
		
	}

	// 네이버 추가 정보
	@Override
	public Member naver(Member member) {	
		return mapper.selectCheckNaverLogin(member);
	}
	
	// 로그아웃 타임
	@Override
	public void updateHistory(String loginId) {
		lomapper.updateHistory(loginId);
		
	}
	
	// 비밀번호 수정
	@Override
	public void updatePass(Member member) {
		member.setPass(member.getPass());
		mapper.updatePass(member);
	}

}
