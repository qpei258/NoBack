package com.noback.group.dao;

import java.util.ArrayList;

import com.noback.group.vo.ScheduleVO;

public interface ScheduleMapper {

	// 스케줄 등록
	public int insertSchedule(ScheduleVO sked);
	
	// 스케줄 수정
	public int updateSchedule(ScheduleVO sked);
	
	// 스케줄 삭제
	public int deleteSchedule(int schedule_num);
	
	// 스케줄 목록 가져오기
	public ArrayList<ScheduleVO> listSchedule();
	
	// 이번달 스케줄만 불러오기
	public ArrayList<ScheduleVO> selectScheduleMonth();
		
	// 스케줄 넘버로 개별정보 가져오기
	public ScheduleVO selectScheduleInfo(int schedule_num);
	
	
	
}
