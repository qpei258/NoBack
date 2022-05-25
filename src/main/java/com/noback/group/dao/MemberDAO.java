package com.noback.group.dao;

import java.util.ArrayList;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.noback.group.vo.MemberVO;






/**
 * 회원 관련 DAO
 * @param <employee_num>
 */
@Repository
public class MemberDAO<employee_num> {
	@Autowired
	SqlSession sqlSession;

	// 로그인
	public MemberVO getMember(String employee_num) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO result = null;

		result = mapper.getMemberVO(employee_num);
		return result;
	}
	
	/**
	 * 회원 가입 처리
	 * @param member 사용자가 입력한 가입 정보
	 */
	
	// 사원등록 처리
	public int insertMember(MemberVO member) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		int result = 0;
		try {
			result = mapper.insertMember(member);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 모든 사원리스트 출력
	public ArrayList<MemberVO> memberlist() {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		ArrayList<MemberVO> memberlist = mapper.memberlist();
		return memberlist;
		
	}
	
	// 사원 이름으로 검색 
	public MemberVO getMemberVO(String employee_name) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO member = mapper.getMemberVO(employee_name);
		
		return member;
	}
	
	// 사원 수정
	public int memberlistupdate(MemberVO member) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = 0;
		result = mapper.memberlistupdate(member);
		return result;
	}
	

}
