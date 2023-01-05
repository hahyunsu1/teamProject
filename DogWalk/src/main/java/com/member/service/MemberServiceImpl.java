package com.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.member.mapper.MemberMapper;
import com.member.model.MemberVO;

@Service("MemberServiceImpl")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper membermapper;

	@Override
	public int MemberJoin(MemberVO member){
		return this.membermapper.MemberJoin(member);
	}
	
	@Override
	public int idCheck(String userid) {
		return this.membermapper.idCheck(userid);
	}

	@Override
	public int nickCheck(String nick) {
		return this.membermapper.nickCheck(nick);
	}

}
