package com.noback.group.dao;

import java.util.ArrayList;

import com.noback.group.vo.MemberVO;

/**
 * 회원 관련 Mybatis 사용 메서드
 */
public interface MemberMapper {
	
	// 로그인
	MemberVO getMemberVO(String employee_num);
	//사원 정보 저장
	int insertMember(MemberVO member);
	// 모든 사원리스트
	ArrayList<MemberVO> memberlist();
	// 이름으로 회원검색
	MemberVO getMemberVO1(String employee_name);
	// 사원정보 수정
	int memberlistupdate(MemberVO member);
	

}
