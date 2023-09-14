package com.jj.daangn_ver2.member.model.service;

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
	public int checkMe(String checkText) {
		System.out.println(checkText);
		//return sqlSession.selectOne("memberMapper.checkMe", checkText);
		return 1;
	}

}
