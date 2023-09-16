package com.jj.daangn_ver2.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jj.daangn_ver2.board.model.vo.Attachment;
import com.jj.daangn_ver2.board.model.vo.Board;
import com.jj.daangn_ver2.common.vo.PageInfo;
import com.jj.daangn_ver2.board.model.dao.BoardDao;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BoardDao boardDao;
	
	//게시글 작성 메소드
	//트랜잭션으로 일괄처리 (보드, 어태치먼트)
	@Override
	@Transactional
	public int insertBoard(Board b, ArrayList<Attachment> list) {
		
		//게시글 등록
		int result1 = boardDao.insertBoard(b, sqlSession);
		
		//어태치먼트 등록
		int result2 = 0;
		for(Attachment at : list) {
			result2 = boardDao.insertAttachment(at, sqlSession);
		}
		
		return result1*result2;
	}

	//게시글 총 수
	@Override
	public int listCount(HashMap<String, String> keyword) {
		return boardDao.listCount(sqlSession, keyword);
	}

	//게시글 리스트
	@Override
	public ArrayList<Board> boardList(HashMap<String, String> keyword, PageInfo pi) {
		return boardDao.boardList(sqlSession, keyword, pi);
	}

	//게시글 상세 페이지
	@Override
	public Board boardDetail(HashMap<String, String> boardInfo) {
		return boardDao.boardDetail(sqlSession, boardInfo);
	}

	//조회수 올려주기
	@Override
	public void countUp(int boardNo) {
		boardDao.countUp(sqlSession, boardNo);
	}

}
