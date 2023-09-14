package com.jj.daangn_ver2.member.model.service;

import com.jj.daangn_ver2.member.model.vo.Member;

public interface MemberService {
	
	//회원가입 메소드
	int insertMember(Member m);

	//아이디, 닉네임 중복 확인 메소드
	int checkMe(String checkText);

}
