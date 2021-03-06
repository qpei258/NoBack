package com.noback.group.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.noback.group.vo.MemberVO;
import com.noback.group.vo.SignVO;



/**
 * 전자결제 관련 DAO
 */
@Repository
public class SignDAO {
	@Autowired
	SqlSession sqlSession;
	
	//결제 올린 서류리스트 
	public ArrayList<SignVO> listSign(Map<String, String> map, int startRecord, int countPerPage) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
			
		//검색어와 읽을 범위를 전달
		ArrayList<SignVO> result = mapper.listSign(map, rb);
		return result;
		}
	
	//결제 대기중인 서류리스트
	public ArrayList<SignVO> listSign2(Map<String, String> map, int startRecord, int countPerPage) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
			
		//검색어와 읽을 범위를 전달
		ArrayList<SignVO> result = mapper.listSign2(map, rb);
		return result;
	}
		
	//(처리해야할)결제서류 읽기
	public SignVO getSign(int sign_num) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		SignVO sign = mapper.getSign(sign_num);
		return sign;
	}
	
	//내가 작성한 결제서류 확인
	public SignVO getSignn(int sign_num) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		SignVO sign = mapper.getSignn(sign_num);
		return sign;
	}
	
	//결제서류 작성
	public int write(SignVO sign) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		int result = 0;
		result = mapper.insertSign(sign);
		return result;		
	}
	//글개수 조회용
	public int getTotal(String searchText) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		int result = 0;
		result = mapper.getTotal(searchText);
		return result;		
	}

	//회원 정보 검색(수신자 찾을떄 쓰는거)
	public MemberVO member(String num) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		MemberVO result = mapper.member(num);
		return result;
	}
	
	//회원 정보 검색(결제문서 불러올떄 쓰는거)
	public ArrayList<MemberVO> getMember(String name) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		ArrayList<MemberVO> member = mapper.getMember(name);
		return member;
	}
	
	//글 수정
	public int complete(SignVO sign) {
		SignMapper mapper = sqlSession.getMapper(SignMapper.class); 
		int result = mapper.complete(sign);
		return result;
	}
	

	
}