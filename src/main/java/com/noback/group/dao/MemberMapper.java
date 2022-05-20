package com.noback.group.dao;

import com.noback.group.vo.MemberVO;

/**
 * 회원 관련 Mybatis 사용 메서드
 */
public interface MemberMapper {
	
	// 로그인
	
	MemberVO getMember(String employee_num);


}
