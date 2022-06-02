package com.noback.group.vo;

public class MessengerVO {
	String employee_num;
	String messenger_writer_name;
	String messenger_content;
	String messenger_date;
	String messenger_reciever_name;
	String picture;
	
	public MessengerVO() {
		super();
	}
	public MessengerVO(String employee_num, String messenger_writer_name, String messenger_content, String messenger_date, String messenger_receiver, String picture) {
		super();
		this.employee_num = employee_num;
		this.messenger_writer_name = messenger_writer_name;
		this.messenger_content = messenger_content;
		this.messenger_date = messenger_date;
		this.messenger_reciever_name = messenger_receiver;
		this.picture=picture;
		
	}
	public String getEmployee_num() {
		return employee_num;
	}
	public void setEmployee_num(String employee_num) {
		this.employee_num = employee_num;
	}
	public String getMessenger_writer_name() {
		return messenger_writer_name;
	}
	public void setMessenger_writer_name(String messenger_writer_name) {
		this.messenger_writer_name = messenger_writer_name;
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
	public String getMessenger_reciever_name() {
		return messenger_reciever_name;
	}
	public void setMessenger_reciever_name(String messenger_reciever_name) {
		this.messenger_reciever_name = messenger_reciever_name;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}

	
	
	@Override
	public String toString() {
		return "MessengerVO [employee_num" + employee_num + "messenger_writer_name=" + messenger_writer_name + ", messenger_content=" + messenger_content + ", messenger_date=" + messenger_date
				+ ", messenger_reciever_name=" +messenger_reciever_name + ", picture=" +picture+"]";
	}
	
	
	
	
}
