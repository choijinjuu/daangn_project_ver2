package com.jj.daangn_ver2.member.model.dao;

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

}
