package com.noback.group.vo;

/**
 * 회원 정보 VO
 */
public class SignVO {

	int sign_num;	  
	String sign_title;
	String sign_content;	
	String sign_sender;  
	String sign_receiver;	
	String sign_originfile;	
	String sign_savedfile;
	int sign_ok;
	String sign_cdate;
	String sign_memo;
	String sign_sdate;
	
	public int getSign_num() {
		return sign_num;
	}
	public void setSign_num(int sign_num) {
		this.sign_num = sign_num;
	}
	public String getSign_title() {
		return sign_title;
	}
	public void setSign_title(String sign_title) {
		this.sign_title = sign_title;
	}
	public String getSign_content() {
		return sign_content;
	}
	public void setSign_content(String sign_content) {
		this.sign_content = sign_content;
	}
	public String getSign_sender() {
		return sign_sender;
	}
	public void setSign_sender(String sign_sender) {
		this.sign_sender = sign_sender;
	}
	public String getSign_receiver() {
		return sign_receiver;
	}
	public void setSign_receiver(String sign_receiver) {
		this.sign_receiver = sign_receiver;
	}
	public String getSign_originfile() {
		return sign_originfile;
	}
	public void setSign_originfile(String sign_originfile) {
		this.sign_originfile = sign_originfile;
	}
	public String getSign_savedfile() {
		return sign_savedfile;
	}
	public void setSign_savedfile(String sign_savedfile) {
		this.sign_savedfile = sign_savedfile;
	}
	public int getSign_ok() {
		return sign_ok;
	}
	public void setSign_ok(int sign_ok) {
		this.sign_ok = sign_ok;
	}
	public String getSign_cdate() {
		return sign_cdate;
	}
	public void setSign_cdate(String sign_cdate) {
		this.sign_cdate = sign_cdate;
	}
	public String getSign_memo() {
		return sign_memo;
	}
	public void setSign_memo(String sign_memo) {
		this.sign_memo = sign_memo;
	}
	public String getSign_sdate() {
		return sign_sdate;
	}
	public void setSign_sdate(String sign_sdate) {
		this.sign_sdate = sign_sdate;
	}
	
	@Override
	public String toString() {
		return "SignVO [sign_num=" + sign_num + ", sign_title=" + sign_title + ", sign_content=" + sign_content
				+ ", sign_sender=" + sign_sender + ", sign_receiver=" + sign_receiver + ", sign_originfile="
				+ sign_originfile + ", sign_savedfile=" + sign_savedfile + ", sign_ok=" + sign_ok + ", sign_cdate="
				+ sign_cdate + ", sign_memo=" + sign_memo + ", sign_sdate=" + sign_sdate + "]";
	}
}
