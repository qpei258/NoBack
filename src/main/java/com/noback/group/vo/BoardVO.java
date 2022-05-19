package com.noback.group.vo;

public class BoardVO {
	int board_num;
	String board_title;
	String board_content;
	String board_date;
	String board_writer;
	public BoardVO() {
		super();
	}
	public BoardVO(int board_num, String board_title, String board_content, String board_date, String board_writer) {
		super();
		this.board_num = board_num;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_writer = board_writer;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	@Override
	public String toString() {
		return "BoardVO [board_num=" + board_num + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_date=" + board_date + ", board_writer=" + board_writer + "]";
	}
	
	
}
