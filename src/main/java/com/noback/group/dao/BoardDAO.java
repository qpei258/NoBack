package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.noback.group.vo.BoardVO;
import com.noback.group.vo.SignVO;

@Repository
public class BoardDAO {
	@Autowired
	SqlSession sqlSession;
	
	
	//게시글 수 반환
	public int getTotal(String search) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class); 
		
		int result = mapper.getTotal(search);
		return result;
	}
	
	
	//게시글 리스트 반환
	public ArrayList<BoardVO> list(String search, int startRecord, int countPerPage) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class); 
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<BoardVO> result = mapper.listBoard(search, rb);
		return result;
	}
	
	
	//특정 게시글 반환
	public BoardVO board(String num) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class); 
		BoardVO result = mapper.board(num);
		return result;
	}
	
	
	//게시글 쓰기
	public int boardWrite(BoardVO board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.boardWrite(board);
		return result;
	}
	
	
	//게시글 삭제
	public int boardDelete(String board_num) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.boardDelete(board_num);
		return result;
	}
	
	
	//게시글 수정
	public int boardUpdate(BoardVO board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.boardUpdate(board);
		return result;
	}
}

