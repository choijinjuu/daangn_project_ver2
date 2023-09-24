package com.jj.daangn_ver2.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jj.daangn_ver2.board.model.vo.Attachment;
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
	public String idCheck(Member m) {
		
		int count = memberService.checkMe(m);
		
		return (count>0)?"NNNNN":"NNNNY";
	}
	
	//아이디 찾기 폼으로 돌려주기
	@RequestMapping("searchIdForm.me")
	public String searchIdForm() {
		return "member/searchId";
	}
	
	//비밀번호 찾기 폼으로 돌려주기
	@RequestMapping("searchPwdForm.me")
	public String searchPwdFrom() {
		return "member/searchPwd";
	}
	
	//이메일 인증번호 보내는 메소드
	public int emailSend(String memberMail) {
		
		System.out.println("인증메일 보내는 중...");
		
		String host = "smtp.naver.com";
		String user = "mailtest0119@naver.com";
		String password = "1s2s3s4s!";
		
		//랜덤 인증 번호
		int ranNum = (int)(Math.random()*9000+1000);
		
		Properties props = System.getProperties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 587);
			props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(memberMail));
			
			message.setSubject("당근마켓의 인증 메일이 도착하였습니다.");
			message.setText("인증번호 : "+ranNum);
			
			Transport.send(message);
			
			System.out.println(memberMail+"로 인증메일 발송 완료, 인증번호 : "+ranNum);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ranNum;
	}
	
	//이메일 인증번호 쏴주기
//	@ResponseBody
//	@RequestMapping("emailCk.fe")
//	public int emailCk(@RequestParam("email")String userMail) {
//		System.out.println("인증메일 보내는중...");
//		int ranNum = emailSend(userMail);
//		return ranNum;
//	}
	
	//아이디 찾기 및 비밀번호 찾기 진행시 인증번호 발송
//	@ResponseBody
//	@GetMapping("searchMe.me")
//	@RequestMapping("searchMe.me")
//	public int searchMe(@RequestParam("memName")String memName, @RequestParam("email")String email) {
//
//		HashMap<String, String> info = new HashMap<>();
//			info.put("memName", memName);
//			info.put("email", email);
//			
//		int result = memberService.searchMe(info);
//		int ranNum = 0;
//		System.out.println(result);
//		if(result>0) {
//			ranNum = emailSend(email);
//		}
//		System.out.println(ranNum);
//		return ranNum;
//	}
	
	@ResponseBody
	@RequestMapping("searchMe.me")
	public String searchMe(String memName, String email) {
		System.out.println(memName);
		System.out.println(email);
		HashMap<String, String> info = new HashMap<>();
			info.put("memName", memName);
			info.put("email", email);
		System.out.println(info);
		String searchText = memberService.searchMe(info);
		System.out.println(searchText);
		String ranNum = "";
		
		if(searchText!=null) {
			ranNum = Integer.toString(emailSend(email));
		}
		System.out.println(ranNum);
		HashMap<String, String> searchGo = new HashMap<>();
			searchGo.put("memId", searchText);
			searchGo.put("ranNum", ranNum);
		System.out.println(searchGo);
		return new Gson().toJson(searchGo);
	}
	
	//로그인 메소드
	@RequestMapping("login.me")
	public String loginMember(String saveId, @RequestParam("userId")String memId, String userPwd, Member m, Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response) {

		//아이디 저장
		Cookie cookie = null;
		
		if(saveId != null && saveId.equals("on")) {//체크 박스 체크시
			//쿠키 생성
			cookie = new Cookie("memId",memId);
			cookie.setMaxAge(60*60*24*14);
			response.addCookie(cookie);
		}else {//체크 아닐시
			cookie = new Cookie("memId",null);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		m.setMemId(memId);
		Member loginMember = memberService.loginMember(m);
		
		if(loginMember!=null && bcryptPasswordEncoder.matches(userPwd, loginMember.getMemPwd())) {
			
			//로그인 유저 있으면 -> 유저 정보 담기
			session.setAttribute("loginMember", loginMember);
			session.setAttribute("alertMsg", "로그인이 완료되었습니다.");
			
			return "redirect:/";
		}else {//로그인 실패시
			model.addAttribute("errorMsg","로그인 실패");
			return "common/errorPage";
		}
	}
	
	//로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.setAttribute("alertMsg", "로그아웃 되었습니다.");
		session.removeAttribute("loginMember");
		return "redirect:/";
	}

	//마이페이지로 이동
	@RequestMapping("mypage.me")
	public String goMypage() {
		return "member/mypageForm";
	}
	
	//정보 수정
	@RequestMapping("updateMy.me")
	public ModelAndView updateMember(Member m, MultipartFile file1, HttpSession session, ModelAndView mv) {
		
		if(!file1.getOriginalFilename().equals("")) {//파일이 있으면
			
			String originName = file1.getOriginalFilename();
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int ranNum = (int) (Math.random()*90000+10000);
			//확장자명 추출
			String ext = originName.substring(originName.lastIndexOf("."));
			//추출한 문자열 합쳐서 changeName만들기
			String changeName = currentTime+ranNum+ext;
			m.setProfileImg("resources/member_img/"+changeName);
			
			//업로드하는 경로
			String filePath = session.getServletContext().getRealPath("/resources/member_img/");
			
			//경로와 수정파일명 합쳐서 파일 업로드
			try {
				file1.transferTo(new File(filePath+changeName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//비밀번호 암호화
			String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
			m.setMemPwd(encPwd);
			
			int result = memberService.updateMember(m);
			
			if(result>0) {
				//로그인 멤버 세션 업데이트
				Member loginMember = memberService.loginMember(m);

				session.setAttribute("loginMember", loginMember);
				session.setAttribute("alertMsg", "정보 수정을 성공하였습니다. 로그인을 다시 시도해주세요.");
				mv.setViewName("redirect:/");
				
			}else {
				mv.addObject("errorMsg", "정보 수정에 실패하셨습니다.").setViewName("common/errorPage");
			}
			
		}
		
		return mv;
	}
}
