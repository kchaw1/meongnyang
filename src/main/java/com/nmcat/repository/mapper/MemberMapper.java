package com.nmcat.repository.mapper;

import java.util.Date;
import java.util.List;

import com.nmcat.repository.domain.Career;
import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.License;
import com.nmcat.repository.domain.Login;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.Page2;
import com.nmcat.repository.domain.board.CommunityBoard;

public interface MemberMapper {
	
	public void insertNewMemberNofile(Member member);
	
	public Member selectMemeberIdandPass(Login login);
	
	public String selectId(String id);
	
	public void insertabsMemberfile(Member member);
	
	/**********로그인 + 10**********/
	void updateScore(String id);
	
	/*********경력********/
	void insertCaree(Career career);
	
	/********자격증*********/
	void insertLicense(License license);
	
	/******추가 정보 *********/
	Member selectCheckNaverLogin(Member member);
	
	/**********비밀번호 수정************/
	void updatePass(Member member);
	
	/****회원정보 수정 할때 비밀번호 재확인 ****/
	int selectRelogin(Member member);
	
	/******이메일 수정************/
	void updateEmail(Member member);
	
	/*****프로필사진 수정*********/
	void updateProfile(Member member);
	
	/*****멤버정보*********/
	Member selectMemberInfo(int no);
	Member selectMemberInfoById(String id);
	
	/*****************최근접속일*******/
	Date selectRac(String id);
	
	/**********내가 쓴 게시물*********/
	List<CommunityBoard> selectMyBoard(String id);
	
	/********내가 쓴 댓글************/
	List<CommunityComment> selectMyComment(String id);
	
	/*******내 활동(게시물 페이징)********/
	List<CommunityBoard> selectComPage(Page2 page2);
	
	/************내 활동(게시물 전체 수 )**************/
	int selectComCount(String id);
	
	/**********내 활동(코멘트 페이징)*************/
	List<CommunityComment> selectCommentPage(Page2 page2);
	
	/************내 활동(코멘트 전체 수)************/
	int selectCommentCount(String id);
	
} // end class
