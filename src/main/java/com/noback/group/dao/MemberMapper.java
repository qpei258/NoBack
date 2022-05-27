package com.noback.group.dao;

import java.util.ArrayList;

import com.noback.group.vo.MemberVO;

/**
 * 회원 관련 Mybatis 사용 메서드
 */
public interface MemberMapper {
	
	// 로그인
	public MemberVO getMemberVO(String employee_num);
	//사원 정보 저장
	public int insertMember(MemberVO member);
	// 모든 사원리스트
	public ArrayList<MemberVO> memberlist();
	// 사원 삭제
	public int memberdelete(String employee_num);
	// 이름으로 회원검색
	public MemberVO getMemberVO1(String employee_name);
	// 사원정보 수정
	public int memberlistupdate(MemberVO member);
	
	

}
