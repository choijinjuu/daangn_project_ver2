package com.jj.daangn_ver2.member.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jj.daangn_ver2.member.model.dao.MemberDao;
import com.jj.daangn_ver2.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
//	@Autowired
//	private ServletContext ServletContext;

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//회원가입
	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}

	//아이디, 닉네임 중복 확인 메소드
	@Override
	public int checkMe(Member m) {
		return memberDao.checkMe(sqlSession, m);
	}

	//아이디 찾기 및 비밀번호 찾기 진행시 인증번호 발송
	@Override
	public String searchMe(HashMap<String, String> info) {
		return memberDao.searchMe(sqlSession, info);
	}

	//로그인 메소드
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}



}
