package com.noback.group.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.noback.group.vo.ScheduleVO;

/**
 * 회원 관련 DAO
 */
@Repository
public class ScheduleDAO {
	
	@Autowired
	SqlSession sqlSession;
		

}
