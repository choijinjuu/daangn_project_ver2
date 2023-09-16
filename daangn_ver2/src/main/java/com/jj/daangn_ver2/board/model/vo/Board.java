package com.jj.daangn_ver2.board.model.vo;

import com.jj.daangn_ver2.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Board {
	
	private int boardNo;
	private int memNo;
	private String writer;
	private String title;
	private String content;
	private String category;
	private int count;
	private String createDate;
	private String subCategory;
	private int price;
	private int success;
	private String openTime;
	private String closeTime;
	private String address;
	private String jobDate;
	
	//join시 사용할 참조변수
	private Attachment attachment;
	private Member member;
	
	

}
