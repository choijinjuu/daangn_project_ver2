package com.jj.daangn_ver2.common.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PageInfo {
	
	private int listCount;
	private int currentPage;
	private int pageLimit;
	private int boardLimit;
	private int maxPage;
	private int startPage;
	private int endPage;

}
