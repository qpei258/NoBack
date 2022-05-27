package com.noback.group.dao;

import java.util.ArrayList;

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
	public int getTotalmessenger(String search) {
		MessengerMapper mapper = sqlSession.getMapper(MessengerMapper.class); 
		
		int result = mapper.getTotalmessenger(search);
		return result;
	}
	public int getTotalmember(String search) {
		MessengerMapper mapper = sqlSession.getMapper(MessengerMapper.class); 
		
		int result = mapper.getTotalmember(search);
		return result;
	}
	
	//글 목록
	public ArrayList<MessengerVO> listMessenger(String search, int startRecord, int countPerPage) {
		MessengerMapper mapper = sqlSession.getMapper(MessengerMapper.class); 
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<MessengerVO> result = mapper.listMessenger(search, rb);
		return result;
	}
	
	public ArrayList<MemberVO> listMember(String search, int startRecord, int countPerPage) {
		MessengerMapper mapper = sqlSession.getMapper(MessengerMapper.class); 
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<MemberVO> result = mapper.listMember(search, rb);
		return result;
	}
	public MessengerVO messenger(String num) {
		MessengerMapper mapper = sqlSession.getMapper(MessengerMapper.class); 
		MessengerVO result = mapper.messenger(num);
		return result;
	}
	
	

	
	
	
	
}

