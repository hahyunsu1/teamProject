package com.member.service;

import com.member.model.MemberVO;

public interface MemberService {
	
	int MemberJoin(MemberVO member);
	
	int idCheck(String userid);
	
	int nickCheck(String nick);
	
	public MemberVO memberLogin(MemberVO member) throws Exception;
	
	MemberVO selectById(String userid);


}
