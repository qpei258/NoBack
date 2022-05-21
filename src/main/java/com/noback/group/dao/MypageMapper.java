package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.noback.group.vo.BoardVO;
import com.noback.group.vo.MemberVO;

public interface MypageMapper {

	// 로그인
	public MemberVO getMemberVO(String employee_num);

	// 개인정보 수정
	public int updateMember(MemberVO member);

	// 마이게시글
	public ArrayList<BoardVO> listBoard(String searchText, RowBounds rb);
	
	// 마이게시글 읽기
	public BoardVO getBoard(String board_num);

	// 전체글 수
	public int getTotal(String searchText);


}
