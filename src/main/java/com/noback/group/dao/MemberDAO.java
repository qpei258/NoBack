package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.noback.group.vo.MemberVO;

/**
 * 회원 관련 DAO
 */
@Repository
public class MemberDAO {
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 회원 가입 처리
	 * @param member 사용자가 입력한 가입 정보
	 */

}
