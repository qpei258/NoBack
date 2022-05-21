package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.noback.group.vo.NoticeVO;

public interface NoticeMapper {

	public int getTotal(String search);

	public ArrayList<NoticeVO> listNotice(String search, RowBounds rb);

	public NoticeVO notice(String notice_num);
	
	public int noticeWrite(NoticeVO notice);
	
	public int noticeDelete(String notice_num);
	
	public int noticeUpdate(NoticeVO notice);
}
