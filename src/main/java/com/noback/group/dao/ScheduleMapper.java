package com.noback.group.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.noback.group.vo.ScheduleVO;

@Repository
public interface ScheduleMapper {

	// 스케줄 목록 가져오기
	public ArrayList<ScheduleVO> calenList();
	
	// 스케줄 등록 (ajax 방식)
	public int insertSchedule(ScheduleVO sked);

	// 스케줄 목록 가져오기
	//public ArrayList<ScheduleVO> listSchedule();
		
	// 이번달 스케줄만 불러오기
	public ArrayList<ScheduleVO> selectScheduleMonth(String schedule_writer);

	// 스케줄 넘버로 개별정보 가져오기
	public ScheduleVO selectScheduleInfo(int schedule_num);

	// 스케줄 수정
	public int updateSchedule(ScheduleVO sked);
		
	// 스케줄 삭제
	public int deleteSchedule(int schedule_num);
	
	//월별 일정 모아보기
	public ArrayList<ScheduleVO> selectScheduleByMonth(String month, String schedule_writer);

	// 스케줄폼 추가 (POST방식)
	public int insertScheduleForm(ScheduleVO schedule);

}

	
