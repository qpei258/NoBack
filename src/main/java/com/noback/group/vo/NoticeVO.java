package com.noback.group.vo;

public class NoticeVO {
	int notice_num;
	String notice_title;
	String notice_content;
	String notice_date;
	String notice_writer;
	String notice_writer_name;
	public NoticeVO() {
		super();
	}
	public NoticeVO(int notice_num, String notice_title, String notice_content, String notice_date, String notice_writer, String notice_writer_name) {
		super();
		this.notice_num = notice_num;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_writer = notice_writer;
		this.notice_writer_name = notice_writer_name;
	}
	public int getnotice_num() {
		return notice_num;
	}
	public void setnotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getnotice_title() {
		return notice_title;
	}
	public void setnotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getnotice_content() {
		return notice_content;
	}
	public void setnotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getnotice_date() {
		return notice_date;
	}
	public void setnotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public String getnotice_writer() {
		return notice_writer;
	}
	public void setnotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	
	public String getnotice_writer_name() {
		return notice_writer_name;
	}
	public void setnotice_writer_name(String notice_writer_name) {
		this.notice_writer_name = notice_writer_name;
	}
	@Override
	public String toString() {
		return "noticeVO [notice_num=" + notice_num + ", notice_title=" + notice_title + ", notice_content=" + notice_content
				+ ", notice_date=" + notice_date + ", notice_writer=" + notice_writer + ", notice_writer_num="
				+ notice_writer_name + "]";
	}
	
	
	
	
}
