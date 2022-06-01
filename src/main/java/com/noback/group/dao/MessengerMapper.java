package com.noback.group.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.noback.group.vo.MemberVO;
import com.noback.group.vo.MessengerVO;

public interface MessengerMapper {

	public int getTotalmessenger(Map<String , String > map );
	
	public int getTotalmember(Map<String , String > map);

	public ArrayList<MessengerVO> listMessenger( Map<String , String > map, RowBounds rb);
	
	public ArrayList<MemberVO> listMember( Map<String , String > map, RowBounds rb);

	public ArrayList<MessengerVO> messenger(Map<String , String > map);
	
	public int messengerinsert(Map<String , String > map);
	

	
	

	



}
