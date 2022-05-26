package com.noback.group.vo;

public class MessengerVO {
	String employee_num;
	String messenger_content;
	String messenger_date;
	String messenger_receiver;
	public MessengerVO() {
		super();
	}
	public MessengerVO(String employee_num, String messenger_content, String messenger_date, String messenger_receiver) {
		super();
		this.employee_num = employee_num;
		this.messenger_content = messenger_content;
		this.messenger_content = messenger_content;
		this.messenger_date = messenger_date;
		this.messenger_receiver = messenger_receiver;

	}
	public String getEmployee_num() {
		return employee_num;
	}
	public void setEmployee_num(String employee_num) {
		this.employee_num = employee_num;
	}
	public String getMessenger_content() {
		return messenger_content;
	}
	public void setMessenger_content(String messenger_content) {
		this.messenger_content = messenger_content;
	}
	public String getMessenger_date() {
		return messenger_date;
	}
	public void setMessenger_date(String messenger_date) {
		this.messenger_date = messenger_date;
	}
	public String getMessenger_receiver() {
		return messenger_receiver;
	}
	public void setMessenger_receiver(String messenger_receiver) {
		this.messenger_receiver = messenger_receiver;
	}
	
	@Override
	public String toString() {
		return "MessengerVO [employee_num=" + employee_num + ", messenger_content=" + messenger_content + ", messenger_date=" + messenger_date
				+ ", messenger_receiver=" +"messenger_receiver"+ "]";
	}
	
	
	
	
}
