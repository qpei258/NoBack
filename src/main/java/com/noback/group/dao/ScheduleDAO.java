package com.noback.group.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.noback.group.vo.ScheduleVO;

/**
 * 사내일정 관련 DAO
 */
@Repository
public class ScheduleDAO {
	
	@Autowired
	SqlSession sqlSession;
		
	// 스케줄 목록 가져오기
	public ArrayList<ScheduleVO> listSchedule(){
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		ArrayList<ScheduleVO> scheduleList 
		= mapper.listSchedule();
			
		return scheduleList;
	}
	
	// 스케줄 넘버로 개별정보 가져오기
	public ScheduleVO selectSchedule(int schedule_num) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		ScheduleVO result = null;
		result = mapper.selectSchedule(schedule_num);
			
		return result;
	}

	// 스케줄 등록
	public int addSchedule(ScheduleVO sked) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		int result = 0;
		result = mapper.insertSchedule(sked);
			
		return result;
		}	
}
