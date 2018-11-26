package com.nmcat.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Login;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;
	
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
		List<String> idList = mapper.selectId();
		boolean result = false;
		for(String oriId : idList) {
			if(oriId.equals(id)) {
				result = true;
				break;
			}
		}
		return result;
		
	}

}
