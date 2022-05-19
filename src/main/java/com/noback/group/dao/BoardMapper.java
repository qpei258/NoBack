package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.noback.group.vo.BoardVO;

public interface BoardMapper {

	public int getTotal(String search);

	public ArrayList<BoardVO> listBoard(String search, RowBounds rb);

	public BoardVO board(String num);
}
