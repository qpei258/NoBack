package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.noback.group.vo.MemberVO;
import com.noback.group.vo.MessengerVO;

public interface MessengerMapper {

	public int getTotalmessenger(String search);
	
	public int getTotalmember(String search);

	public ArrayList<MessengerVO> listMessenger(String search, RowBounds rb);
	
	public ArrayList<MemberVO> listMember(String search, RowBounds rb);

	public MessengerVO messenger(String num);
	
	
	

	



}
