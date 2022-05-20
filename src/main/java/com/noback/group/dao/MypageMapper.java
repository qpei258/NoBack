package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.noback.group.vo.BoardVO;
import com.noback.group.vo.MemberVO;

public interface MypageMapper {

	// 로그인
	MemberVO getMemberVO(String employee_num);

	// 개인정보 수정
	int updateMember(String employee_num);

	// 마이게시글
	ArrayList<BoardVO> listBoard(String searchText, RowBounds rb);
	
	// 마이게시글 읽기
	BoardVO getBoard(String boardnum);

	// 전체글 수
	int getTotal(String searchText);


}
