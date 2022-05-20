package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.noback.group.vo.BoardVO;
import com.noback.group.vo.MemberVO;
import com.noback.group.vo.SignVO;








/**
 * 전자결제 관련 DAO
 */
@Repository
public class SignDAO {
	@Autowired
	SqlSession sqlSession;
	
	//E004
	public ArrayList<SignVO> listSign(String searchText, int startRecord, int countPerPage) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
			
		//검색어와 읽을 범위를 전달
		ArrayList<SignVO> result = mapper.listSign(searchText, rb);
		return result;
		}
		
	//결제서류 읽기
	public SignVO getSign(int sign_num) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		
		SignVO sign = mapper.getSign(sign_num);
		return sign;
	}
	
	//결제서류 작성
	public int write(SignVO sign) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		int result = 0;
		result = mapper.insertSign(sign);
		return result;		
	}

	public int getTotal(String searchText) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		int result = 0;
		result = mapper.getTotal(searchText);
		return result;		
	}

	public MemberVO getMember(String name) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		MemberVO member = null;
		member = mapper.getMember(name);
		return member;
	}

	public MemberVO member(String num) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		MemberVO result = mapper.member(num);
		return result;
	}

}