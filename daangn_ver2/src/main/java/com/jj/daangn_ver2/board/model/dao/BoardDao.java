package com.jj.daangn_ver2.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jj.daangn_ver2.board.model.vo.Attachment;
import com.jj.daangn_ver2.board.model.vo.Board;
import com.jj.daangn_ver2.common.vo.PageInfo;

@Repository
public class BoardDao {

	//게시글 등록
	public int insertBoard(Board b, SqlSession sqlSession) {
		
		//게시글 등록
		int result1 = sqlSession.insert("boardMapper.insertBoard", b);
		
		int result2 = 0;
		//들어온 카테고리 종류에 따라
		if(b.getCategory().equals("1")) {
			//플리마켓 등록
			result2 = sqlSession.insert("boardMapper.insertFlea", b);
		}else if(b.getCategory().equals("2")) {
			//동네가게 등록
			result2 = sqlSession.insert("boardMapper.insertStore", b);
		}else {
			//알바 등록
			result2 = sqlSession.insert("boardMapper.insertJob", b);
		}
		return result1*result2;
	}
	
	//어태치먼트 등록
	public int insertAttachment(Attachment at, SqlSession sqlSession) {
		return sqlSession.insert("boardMapper.insertAttachment", at);
	}

	//게시글 총 수
	public int listCount(SqlSession sqlSession, HashMap<String, String> keyword) {
		return sqlSession.selectOne("boardMapper.listCount", keyword);
	}

	//게시글 리스트
	public ArrayList<Board> boardList(SqlSession sqlSession, HashMap<String, String> keyword, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.boardList", keyword, rowBounds);
	}

	//게시글 상세 페이지
	public Board boardDetail(SqlSession sqlSession, HashMap<String, String> boardInfo) {
		return sqlSession.selectOne("boardMapper.boardDetail", boardInfo);
	}

	//조회수 올려주기
	public void countUp(SqlSession sqlSession, int boardNo) {
		sqlSession.update("boardMapper.countUp", boardNo);
		
	}

	//게시글 삭제
	public int deleteBoard(SqlSession sqlSession, HashMap<String, String> boardInfo) {
		return sqlSession.delete("boardMapper.deleteBoard", boardInfo);
	}
	//관련 어태치먼트 게시글 삭제
	public int deleteAttach(SqlSession sqlSession, HashMap<String, String> boardInfo) {
		return sqlSession.delete("boardMapper.deleteATTACH", boardInfo);
	}
	//관련 카테고리 게시글 삭제
	public int deleteBoardCate(SqlSession sqlSession, HashMap<String, String> boardInfo) {
		return sqlSession.delete("boardMapper.deleteBoardCate", boardInfo);
	}


}
