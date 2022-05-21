package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.noback.group.vo.NoticeVO;

@Repository
public class NoticeDAO {
	@Autowired
	SqlSession sqlSession;
	
	public int getTotal(String search) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class); 
		
		int result = mapper.getTotal(search);
		return result;
	}

	public ArrayList<NoticeVO> list(String search, int startRecord, int countPerPage) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class); 
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<NoticeVO> result = mapper.listNotice(search, rb);
		return result;
	}
	
	public NoticeVO notice(String num) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class); 
		NoticeVO result = mapper.notice(num);
		return result;
	}
	
	public int noticeWrite(NoticeVO notice) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int result = mapper.noticeWrite(notice);
		return result;
	}
	
	public int noticeDelete(String notice_num) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int result = mapper.noticeDelete(notice_num);
		return result;
	}
	
	public int noticeUpdate(NoticeVO notice) {
		NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
		int result = mapper.noticeUpdate(notice);
		return result;
	}
}

