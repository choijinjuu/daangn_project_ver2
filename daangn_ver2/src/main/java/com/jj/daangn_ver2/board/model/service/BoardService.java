package com.jj.daangn_ver2.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.jj.daangn_ver2.board.model.vo.Attachment;
import com.jj.daangn_ver2.board.model.vo.Board;
import com.jj.daangn_ver2.common.vo.PageInfo;

public interface BoardService {

	//게시글 작성 메소드
	int insertBoard(Board b, ArrayList<Attachment> list);

	//게시글 총 수
	int listCount(HashMap<String, String> keyword);

	//게시글 리스트
	ArrayList<Board> boardList(HashMap<String, String> keyword, PageInfo pi);

	//게시글 상세 페이지
	Board boardDetail(HashMap<String, String> boardInfo);
	
	//조회수 올려주기
	void countUp(int boardNo);

	//게시글 삭제
	int deleteBoard(HashMap<String, String> boardInfo);

}
