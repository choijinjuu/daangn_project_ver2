package com.jj.daangn_ver2.member.model.service;

import java.util.HashMap;

import com.jj.daangn_ver2.member.model.vo.Member;

public interface MemberService {
	
	//회원가입 메소드
	int insertMember(Member m);

	//아이디, 닉네임 중복 확인 메소드
	int checkMe(Member m);

	//로그인 메소드
	Member loginMember(Member m);

	//아이디 찾기 및 비밀번호 찾기 진행시 인증번호 발송
	String searchMe(HashMap<String, String> info);

	//정보 수정
	int updateMember(Member m);

}
