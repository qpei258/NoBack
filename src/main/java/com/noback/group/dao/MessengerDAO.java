package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.noback.group.vo.BoardVO;
import com.noback.group.vo.SignVO;

@Repository
public class MessengerDAO {
	@Autowired
	SqlSession sqlSession;
	
	public int getTotal(String search) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class); 
		
		int result = mapper.getTotal(search);
		return result;
	}

	public ArrayList<BoardVO> list(String search, int startRecord, int countPerPage) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class); 
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<BoardVO> result = mapper.listBoard(search, rb);
		return result;
	}
	
	public BoardVO board(String num) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class); 
		BoardVO result = mapper.board(num);
		return result;
	}
	
	public int boardWrite(BoardVO board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.boardWrite(board);
		return result;
	}
	
	public int boardDelete(String board_num) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.boardDelete(board_num);
		return result;
	}
	
	public int boardUpdate(BoardVO board) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		int result = mapper.boardUpdate(board);
		return result;
	}
}

