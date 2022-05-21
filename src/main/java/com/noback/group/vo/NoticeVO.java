package com.noback.group.vo;

public class NoticeVO {
	int notice_num;
	String notice_title;
	String notice_content;
	String notice_date;
	String notice_writer;
	String notice_writer_name;
	String notice_originfile;
	String notice_savedfile;
	public NoticeVO() {
		super();
	}
	public NoticeVO(int notice_num, String notice_title, String notice_content, String notice_date,
			String notice_writer, String notice_writer_name, String notice_originfile, String notice_savedfile) {
		super();
		this.notice_num = notice_num;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_writer = notice_writer;
		this.notice_writer_name = notice_writer_name;
		this.notice_originfile = notice_originfile;
		this.notice_savedfile = notice_savedfile;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public String getNotice_writer_name() {
		return notice_writer_name;
	}
	public void setNotice_writer_name(String notice_writer_name) {
		this.notice_writer_name = notice_writer_name;
	}
	public String getNotice_originfile() {
		return notice_originfile;
	}
	public void setNotice_originfile(String notice_originfile) {
		this.notice_originfile = notice_originfile;
	}
	public String getNotice_savedfile() {
		return notice_savedfile;
	}
	public void setNotice_savedfile(String notice_savedfile) {
		this.notice_savedfile = notice_savedfile;
	}
	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_date=" + notice_date + ", notice_writer=" + notice_writer
				+ ", notice_writer_name=" + notice_writer_name + ", notice_originfile=" + notice_originfile
				+ ", notice_savedfile=" + notice_savedfile + "]";
	}

	
	
}
