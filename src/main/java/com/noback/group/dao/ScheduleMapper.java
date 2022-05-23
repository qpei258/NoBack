package com.noback.group.dao;

import java.util.ArrayList;

import com.noback.group.vo.ScheduleVO;

public interface ScheduleMapper {

	// 스케줄 등록
	public int insertSchedule(ScheduleVO sked);
	
	// 스케줄 수정
	public int updateSchedule(ScheduleVO sked);
	
	// 스케줄 삭제
	public int deleteSchedule(ScheduleVO sked);
	
	// 스케줄 목록 가져오기
	public ArrayList<ScheduleVO> listSchedule(String schedule_num);
	
	// 스케줄 넘버로 개별정보 가져오기
	public ScheduleVO selectSchedule(String schedule_num);
}
