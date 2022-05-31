package com.noback.group.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.noback.group.vo.MemberVO;
import com.noback.group.vo.MessengerVO;


@Repository
public class MessengerDAO {
	@Autowired
	SqlSession sqlSession;
	
	//글 개수
	public int getTotalmessenger(String search, String searchId) {
		MessengerMapper mapper = sqlSession.getMapper(MessengerMapper.class); 
		Map<String, String> map=new HashMap<String, String>();
		map.put("search", search);
		map.put("searchId", searchId);
		int result = mapper.getTotalmember(map);
		return result;
			
	}
	public int getTotalmember(String search, String searchId) {
		MessengerMapper mapper = sqlSession.getMapper(MessengerMapper.class); 
		Map<String, String> map=new HashMap<String, String>();
		map.put("search", search);
		map.put("searchId", searchId);
		int result = mapper.getTotalmember(map);
		return result;
	}
	
	//글 목록
	public ArrayList<MessengerVO> listMessenger(String searchId, String search, int startRecord, int countPerPage) {
		MessengerMapper mapper = sqlSession.getMapper(MessengerMapper.class); 
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		Map<String, String> map=new HashMap<String, String>();
		map.put("search", search);
		map.put("searchId", searchId);
		ArrayList<MessengerVO> result = mapper.listMessenger(map, rb);
		return result;
	}
	
	public ArrayList<MemberVO> listMember(String searchId, String search, int startRecord, int countPerPage) {
		MessengerMapper mapper = sqlSession.getMapper(MessengerMapper.class); 
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		Map<String, String> map=new HashMap<String, String>();
		map.put("search", search);
		map.put("searchId", searchId);
		ArrayList<MemberVO> result = mapper.listMember(map, rb);
		return result;
	}
	public ArrayList<MessengerVO> messenger(String num, String searchId) {
		MessengerMapper mapper = sqlSession.getMapper(MessengerMapper.class); 
		Map<String, String> map=new HashMap<String, String>();
		map.put("num", num);
		map.put("searchId", searchId);
		ArrayList<MessengerVO> result = mapper.messenger(map);
		return result;
	}
	public int messenger_insert(String num, String searchId, String content) {
		MessengerMapper mapper = sqlSession.getMapper(MessengerMapper.class); 
		Map<String, String> map=new HashMap<String, String>();
		map.put("num", num);
		map.put("searchId", searchId);
		map.put("content", content);
		int result = mapper.messengerinsert(map);
		return result;
	
	}
	}
	

	
	
	
	


