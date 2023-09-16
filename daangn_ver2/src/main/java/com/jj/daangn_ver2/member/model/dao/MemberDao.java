package com.jj.daangn_ver2.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jj.daangn_ver2.member.model.vo.Member;

@Repository
public class MemberDao {

	//회원가입 메소드
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	//아이디, 닉네임 중복 확인 메소드
	public int checkMe(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.checkMe", m);
	}

	//아이디 찾기 및 비밀번호 찾기 진행시 인증번호 발송
	public String searchMe(SqlSessionTemplate sqlSession, HashMap<String, String> info) {
		return sqlSession.selectOne("memberMapper.searchMe", info);
	}

	//로그인 메소드
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	

}
