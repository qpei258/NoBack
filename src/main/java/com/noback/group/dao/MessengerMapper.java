package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.noback.group.vo.BoardVO;

public interface MessengerMapper {

	public int getTotal(String search);

	public ArrayList<BoardVO> listBoard(String search, RowBounds rb);

	public BoardVO board(String num);
	
	public int boardWrite(BoardVO board);
	
	public int boardDelete(String board_num);
	
	public int boardUpdate(BoardVO board);
}
