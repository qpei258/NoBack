package com.noback.group.vo;

/**
 * 스케줄 정보 VO
 */
public class ScheduleVO {
	
	private int schedule_num;
	private String schedule_title;
	private String schedule_start;
	private String schedule_end;	
	private String schedule_memo;	
	private String schedule_writer;	
	private String schedule_level;
	
	public ScheduleVO() {
		
	}

	public ScheduleVO(int schedule_num, String schedule_title, String schedule_start, String schedule_end,
			String schedule_memo, String schedule_writer, String schedule_level) {
		super();
		this.schedule_num = schedule_num;
		this.schedule_title = schedule_title;
		this.schedule_start = schedule_start;
		this.schedule_end = schedule_end;
		this.schedule_memo = schedule_memo;
		this.schedule_writer = schedule_writer;
		this.schedule_level = schedule_level;
	}

	public int getSchedule_num() {
		return schedule_num;
	}

	public void setSchedule_num(int schedule_num) {
		this.schedule_num = schedule_num;
	}

	public String getSchedule_title() {
		return schedule_title;
	}

	public void setSchedule_title(String schedule_title) {
		this.schedule_title = schedule_title;
	}

	public String getSchedule_start() {
		return schedule_start;
	}

	public void setSchedule_start(String schedule_start) {
		this.schedule_start = schedule_start;
	}

	public String getSchedule_end() {
		return schedule_end;
	}

	public void setSchedule_end(String schedule_end) {
		this.schedule_end = schedule_end;
	}

	public String getSchedule_memo() {
		return schedule_memo;
	}

	public void setSchedule_memo(String schedule_memo) {
		this.schedule_memo = schedule_memo;
	}

	public String getSchedule_writer() {
		return schedule_writer;
	}

	public void setSchedule_writer(String schedule_writer) {
		this.schedule_writer = schedule_writer;
	}

	public String getSchedule_level() {
		return schedule_level;
	}

	public void setSchedule_level(String schedule_level) {
		this.schedule_level = schedule_level;
	}

	@Override
	public String toString() {
		return "ScheduleVO [schedule_num=" + schedule_num + ", schedule_title=" + schedule_title + ", schedule_start="
				+ schedule_start + ", schedule_end=" + schedule_end + ", schedule_memo=" + schedule_memo
				+ ", schedule_writer=" + schedule_writer + ", schedule_level=" + schedule_level + "]";
	}


	
}
