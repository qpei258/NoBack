package com.noback.group.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.noback.group.vo.ScheduleVO;

@Repository
public interface ScheduleMapper {

	public ArrayList<ScheduleVO> calenList();
	
	// 스케줄 등록
	public int insertSchedule(ScheduleVO sked);

	// 스케줄 목록 가져오기
	public ArrayList<ScheduleVO> listSchedule();
		
	// 이번달 스케줄만 불러오기
	public ArrayList<ScheduleVO> selectScheduleMonth();

}

	
