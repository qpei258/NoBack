package com.noback.group.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.noback.group.vo.ScheduleVO;

/**
 * 사내일정 관련 DAO
 */

@Service
public class ScheduleDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 스케줄 목록 가져오기
	public ArrayList<ScheduleVO> calenList( Map<String, String> map) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		
		return mapper.calenList(map);
	}

	// 스케줄 등록
	public int addSchedule(ScheduleVO sked) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		int result = 0;
		result = mapper.insertSchedule(sked);
				
		return result;
		}
	
	/*
	// 스케줄 목록 가져오기
	public ArrayList<ScheduleVO> listSchedule(){
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		ArrayList<ScheduleVO> scheduleList 
		= mapper.listSchedule();
				
		return scheduleList;
	}
	*/
		
	// 스케줄 이번달 목록 가져오기
	public ArrayList<ScheduleVO> listScheduleMonth(String schedule_writer){
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		ArrayList<ScheduleVO> MonthScheduleList 
		= mapper.selectScheduleMonth(schedule_writer);
					
		return MonthScheduleList;
	}
	
	// 스케줄 넘버로 개별정보 가져오기
	public ScheduleVO getSchedule(int schedule_num) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		ScheduleVO result = null;
		result = mapper.selectScheduleInfo(schedule_num);
				
		return result;
	}
	
	// 스케줄 수정
	public int updateSchedule(ScheduleVO sked) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		int result = 0;
		result = mapper.updateSchedule(sked);
			
		return result;
	}
				
	// 스케줄 삭제
	public int deleteSchedule(int schedule_num) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		int result = 0;
		result = mapper.deleteSchedule(schedule_num);
				
		return result;
	}

	//스케주 월별로 출력
	public ArrayList<ScheduleVO> listScheduleByMonth(String month, String schedule_writer) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		
		Map<String, String> map =new HashMap<String, String>();
		
		map.put("month", month);
		map.put("schedule_writer", schedule_writer);
		
		ArrayList<ScheduleVO> MonthScheduleList 
		= mapper.selectScheduleByMonth(map);
					
		return MonthScheduleList;

	}

	public int addScheduleForm(ScheduleVO schedule) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		int result = 0;
		result = mapper.insertScheduleForm(schedule);
				
		return result;
	}
}
