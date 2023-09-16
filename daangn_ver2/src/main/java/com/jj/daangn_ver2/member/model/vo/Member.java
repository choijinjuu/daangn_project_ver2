package com.jj.daangn_ver2.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {

	private int memNo;			//	MEM_NO
	private String memId;		//	MEM_ID
	private String nickName;	//	NICKNAME
	private String memPwd;		//	MEM_PWD
	private String address;		//	ADDRESS
	private String email;		//	EMAIL
	private String profileImg;	//	PROFILE_IMG
	private String updateDate;	//	UPDATE_DATE
	private String enrollDate;	//	ENROLL_DATE
	private String status;		//	STATUS
	private String memName;		//	MEM_NAME
	
	/* 회원가입 생성자 */
	public Member(int memNo, String memId, String nickName, String memPwd, String address, String email, String memName) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.nickName = nickName;
		this.memPwd = memPwd;
		this.address = address;
		this.email = email;
		this.memName = memName;
	}
	
	
	
}
