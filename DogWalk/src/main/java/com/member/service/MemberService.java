package com.member.service;

import com.member.model.MemberVO;

public interface MemberService {
	
	int MemberJoin(MemberVO member);
	
	int idCheck(String userid);
	
	int nickCheck(String nick);

}
