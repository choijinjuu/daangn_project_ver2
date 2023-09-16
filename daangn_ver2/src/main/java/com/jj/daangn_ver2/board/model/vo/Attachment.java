package com.jj.daangn_ver2.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Attachment {
	
	private int fileNo;
	private int boardNo;
	private String atName;
	private String atChange;
	private String atPath;
	private String atDate;
	private int fileLevel;

}
