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
	
	public int getTotal(String search) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class); 
		
		int result = mapper.getTotal(search);
		return result;
	}

	public ArrayList<BoardVO> list(String search, int startRecord, int countPerPage) {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class); 
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<BoardVO> result = mapper.listBoard(search, rb);
		return null;
	}
}
