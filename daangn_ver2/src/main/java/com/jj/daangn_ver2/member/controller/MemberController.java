package com.jj.daangn_ver2.member.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jj.daangn_ver2.member.model.service.MemberService;
import com.jj.daangn_ver2.member.model.vo.Member;

@Controller
public class MemberController {
	
	//비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	//회원가입 페이지로 이동
	@RequestMapping("enrollForm.me")
	public String enrollForm(){
		return "member/memberEnrollForm";
	}
	
	//회원가입 메소드
	@RequestMapping("insert.me")
	public ModelAndView insertMember(Member m, HttpSession session, ModelAndView mv) {
		
		//비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		m.setMemPwd(encPwd);
		
		System.out.println(m);
		
		int result = memberService.insertMember(m);
		
		if(result>0) {
			
			session.setAttribute("alertMsg", "회원가입을 성공하였습니다.");
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("errorMsg", "회원가입에 실패하셨습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//아이디, 닉네임 중복 확인 메소드
	@ResponseBody
	@RequestMapping("check.me")
	public String idCheck(String checkText) {
		
		int count = memberService.checkMe(checkText);
		
		return (count>0)?"NNNNN":"NNNNY";
	}

	//마이페이지로 이동
	@RequestMapping("mypage.me")
	public String goMypage() {
		return "member/mypageForm";
	}
	

}
