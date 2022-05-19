package com.noback.group.vo;

/**
 * 회원 정보 VO
 */
public class ScheduleVO {
	
	private int schedule_num;
	private String subject;
	private String startDate;
	private String endDate;	
	private String schedule_memo;	
	private String schedule_writer;	
	private String schedule_level;
	
	public ScheduleVO() {
		
	}

	public ScheduleVO(int schedule_num, String subject, String startDate, String endDate, String schedule_memo, String schedule_writer,
			String schedule_level) {
		super();
		this.schedule_num = schedule_num;
		this.subject = subject;
		this.startDate = startDate;
		this.endDate = endDate;
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


	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
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
		return "ScheduleVO [schedule_num=" + schedule_num + ", subject=" + subject + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", schedule_memo=" + schedule_memo + ", schedule_writer=" + schedule_writer
				+ ", schedule_level=" + schedule_level + "]";
	}


	
}
