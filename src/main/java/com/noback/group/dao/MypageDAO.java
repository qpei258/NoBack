package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.noback.group.vo.*;

/**
 * 마이페이지-게시글 관련 DAO
 */
@Repository
public class MypageDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	
	// 개인정보 출력
	public MemberVO getMember(String employee_num) {
		MypageMapper mapper = sqlSession.getMapper(MypageMapper.class);
		MemberVO result = null;

		result = mapper.getMemberVO(employee_num);
		return result;
	}
	
	// 개인정보 수정
	public int updateMember(MemberVO member) {
		MypageMapper mapper = sqlSession.getMapper(MypageMapper.class);
		int result = 0;
		result = mapper.updateMember(member);
		return result;
	}
	
	// 마이게시글 리스트	(내가쓴 글만)
	public ArrayList<BoardVO> list(String searchText, int startRecord, int countPerPage) {
		MypageMapper mapper = sqlSession.getMapper(MypageMapper.class);
		
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		ArrayList<BoardVO> result = mapper.listBoard(searchText, rb);
		return result;
	}
	
	//게시글 선택하나 출력
	public BoardVO board(String board_num){
		MypageMapper mapper = sqlSession.getMapper(MypageMapper.class);
		//해당번호의 글정보 읽기
		BoardVO result = mapper.getBoard(board_num);
		return result;
	}

	// 글 개수
	public int getTotal(String searchText) {
		MypageMapper mapper = sqlSession.getMapper(MypageMapper.class);
		int result = 0;
		result = mapper.getTotal(searchText);
		return result;		
	}
}
