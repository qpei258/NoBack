package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.springframework.ui.Model;

import com.noback.group.vo.AlarmVO;
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
	public ArrayList<MemberVO> memberlist(String search, RowBounds rb);
	// 사원 삭제
	public int memberdelete(String employee_num);
	// 이름으로 회원검색
	public MemberVO searchmember(String employee_name);
	// 페이지 글 카운트
	public int count(String search);
	// 사원정보 수정
	public int memberlistupdate(MemberVO member);
	
	
	public AlarmVO getAlarm(String LoginId);

}
