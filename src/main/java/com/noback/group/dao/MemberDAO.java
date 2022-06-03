package com.noback.group.dao;

import java.util.ArrayList;


import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.noback.group.vo.AlarmVO;
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
			mapper.addTrigger(member.getEmployee_num());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 모든 사원리스트 출력
	public ArrayList<MemberVO> memberlist(String search, int startRecord, int countPerPage) {
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		ArrayList<MemberVO> memberlist = mapper.memberlist(search, rb);
		return memberlist;
		
	}
	
	// 사원삭제
	public int memberdelete(String employee_num) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = mapper.memberdelete(employee_num);
		return result;
	}

	
	// 사원 이름으로 검색 
	
	public int count(String search) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		return mapper.count(search);
	}
	
	
	// 사원 수정
	public int memberlistupdate(MemberVO member) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = 0;
		result = mapper.memberlistupdate(member);
		return result;
	}
	

	//알람 트리거 가져오기
	public AlarmVO getAlarm(String LoginId) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.getAlarm(LoginId);
	}


	//일정 알람 업데이트
	public int updateScheduleAlarm(AlarmVO alarm) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.updateScheduleAlarm(alarm);
		
	}
	
	//결제 알람 업데이트
	public int updateSignAlarm(AlarmVO alarm) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.updateSignAlarm(alarm);
	}
	//메시지 알람 업데이트
	
	public int updateMessengerAlarm(AlarmVO alarm) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.updateMessengerAlarm(alarm);
	}
	
}

	


