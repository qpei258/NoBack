package com.noback.group.vo;

public class AlarmVO {
	private int alarm_num;
	private String employee_num;
	private int messenger;
	private int sign;
	private int schedule;
	public AlarmVO() {
		super();
	}
	public AlarmVO(int alarm_num, String employee_num, int messenger, int sign, int schedule) {
		super();
		this.alarm_num = alarm_num;
		this.employee_num = employee_num;
		this.messenger = messenger;
		this.sign = sign;
		this.schedule = schedule;
	}
	@Override
	public String toString() {
		return "AlarmVO [alarm_num=" + alarm_num + ", employee_num=" + employee_num + ", messenger=" + messenger
				+ ", sign=" + sign + ", schedule=" + schedule + "]";
	}
	public int getAlarm_num() {
		return alarm_num;
	}
	public void setAlarm_num(int alarm_num) {
		this.alarm_num = alarm_num;
	}
	public String getEmployee_num() {
		return employee_num;
	}
	public void setEmployee_num(String employee_num) {
		this.employee_num = employee_num;
	}
	public int getMessenger() {
		return messenger;
	}
	public void setMessenger(int messenger) {
		this.messenger = messenger;
	}
	public int getSign() {
		return sign;
	}
	public void setSign(int sign) {
		this.sign = sign;
	}
	public int getSchedule() {
		return schedule;
	}
	public void setSchedule(int schedule) {
		this.schedule = schedule;
	}
	
	
}
