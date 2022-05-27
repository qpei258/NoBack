package com.noback.group.vo;

/**
 * 회원 정보 VO
 */
public class SignVO {
	


	int sign_num; //글번호
	String sign_title; //글제목
	String sign_content; //글내용
	String sign_sender;  //송신자(사원번호)
	String sign_nsender; //송신자이름
	String sign_receiver1; //수신자1(사원번호)
	String sign_nreceiver1; //수신자1(이름)
	String sign_receiver2;//수신자2(사원번호)
	String sign_nreceiver2; //수신자2(이름)
	String sign_receiver3;//수신자3(사원번호)
	String sign_nreceiver3; //수신자3(이름)
	String sign_receiver4;//수신자4(사원번호)
	String sign_nreceiver4; //수신자4(이름)
	String sign_dep;//부서
	String sign_pos;//직위
	String sign_originfile;	//첨부파일
	String sign_savedfile; //첨부파일
	int sign_ok1;//수신자1의 결제여부
	int sign_ok2;//수신자2의 결제여부
	int sign_ok3;//수신자3의 결제여부
	int sign_ok4;//수신자4의 결제여부
	String sign_cdate; // 결제 올린날짜
	String sign_memo; //결제 메모
	String sign_sdate;
	public SignVO(){
		super();
	}
	
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
	public String getSign_nsender() {
		return sign_nsender;
	}
	public void setSign_nsender(String sign_nsender) {
		this.sign_nsender = sign_nsender;
	}
	public String getSign_receiver1() {
		return sign_receiver1;
	}
	public void setSign_receiver1(String sign_receiver1) {
		this.sign_receiver1 = sign_receiver1;
	}
	public String getSign_nreceiver1() {
		return sign_nreceiver1;
	}
	public void setSign_nreceiver1(String sign_nreceiver1) {
		this.sign_nreceiver1 = sign_nreceiver1;
	}
	public String getSign_receiver2() {
		return sign_receiver2;
	}
	public void setSign_receiver2(String sign_receiver2) {
		this.sign_receiver2 = sign_receiver2;
	}
	public String getSign_nreceiver2() {
		return sign_nreceiver2;
	}
	public void setSign_nreceiver2(String sign_nreceiver2) {
		this.sign_nreceiver2 = sign_nreceiver2;
	}
	public String getSign_receiver3() {
		return sign_receiver3;
	}
	public void setSign_receiver3(String sign_receiver3) {
		this.sign_receiver3 = sign_receiver3;
	}
	public String getSign_nreceiver3() {
		return sign_nreceiver3;
	}
	public void setSign_nreceiver3(String sign_nreceiver3) {
		this.sign_nreceiver3 = sign_nreceiver3;
	}
	public String getSign_receiver4() {
		return sign_receiver4;
	}
	public void setSign_receiver4(String sign_receiver4) {
		this.sign_receiver4 = sign_receiver4;
	}
	public String getSign_nreceiver4() {
		return sign_nreceiver4;
	}
	public void setSign_nreceiver4(String sign_nreceiver4) {
		this.sign_nreceiver4 = sign_nreceiver4;
	}
	public String getSign_dep() {
		return sign_dep;
	}
	public void setSign_dep(String sign_dep) {
		this.sign_dep = sign_dep;
	}
	public String getSign_pos() {
		return sign_pos;
	}
	public void setSign_pos(String sign_pos) {
		this.sign_pos = sign_pos;
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
	public int getSign_ok1() {
		return sign_ok1;
	}
	public void setSign_ok1(int sign_ok1) {
		this.sign_ok1 = sign_ok1;
	}
	public int getSign_ok2() {
		return sign_ok2;
	}
	public void setSign_ok2(int sign_ok2) {
		this.sign_ok2 = sign_ok2;
	}
	public int getSign_ok3() {
		return sign_ok3;
	}
	public void setSign_ok3(int sign_ok3) {
		this.sign_ok3 = sign_ok3;
	}
	public int getSign_ok4() {
		return sign_ok4;
	}
	public void setSign_ok4(int sign_ok4) {
		this.sign_ok4 = sign_ok4;
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
				+ ", sign_sender=" + sign_sender + ", sign_nsender=" + sign_nsender + ", sign_receiver1="
				+ sign_receiver1 + ", sign_nreceiver1=" + sign_nreceiver1 + ", sign_receiver2=" + sign_receiver2
				+ ", sign_nreceiver2=" + sign_nreceiver2 + ", sign_receiver3=" + sign_receiver3 + ", sign_nreceiver3="
				+ sign_nreceiver3 + ", sign_receiver4=" + sign_receiver4 + ", sign_nreceiver4=" + sign_nreceiver4
				+ ", sign_dep=" + sign_dep + ", sign_pos=" + sign_pos + ", sign_originfile=" + sign_originfile
				+ ", sign_savedfile=" + sign_savedfile + ", sign_ok1=" + sign_ok1 + ", sign_ok2=" + sign_ok2
				+ ", sign_ok3=" + sign_ok3 + ", sign_ok4=" + sign_ok4 + ", sign_cdate=" + sign_cdate + ", sign_memo="
				+ sign_memo + ", sign_sdate=" + sign_sdate + "]";
	}
	
	public SignVO(int sign_num, String sign_title, String sign_content, String sign_sender, String sign_nsender,
			String sign_receiver1, String sign_nreceiver1, String sign_receiver2, String sign_nreceiver2,
			String sign_receiver3, String sign_nreceiver3, String sign_receiver4, String sign_nreceiver4,
			String sign_dep, String sign_pos, String sign_originfile, String sign_savedfile, int sign_ok1, int sign_ok2,
			int sign_ok3, int sign_ok4, String sign_cdate, String sign_memo, String sign_sdate) {
		super();
		this.sign_num = sign_num;
		this.sign_title = sign_title;
		this.sign_content = sign_content;
		this.sign_sender = sign_sender;
		this.sign_nsender = sign_nsender;
		this.sign_receiver1 = sign_receiver1;
		this.sign_nreceiver1 = sign_nreceiver1;
		this.sign_receiver2 = sign_receiver2;
		this.sign_nreceiver2 = sign_nreceiver2;
		this.sign_receiver3 = sign_receiver3;
		this.sign_nreceiver3 = sign_nreceiver3;
		this.sign_receiver4 = sign_receiver4;
		this.sign_nreceiver4 = sign_nreceiver4;
		this.sign_dep = sign_dep;
		this.sign_pos = sign_pos;
		this.sign_originfile = sign_originfile;
		this.sign_savedfile = sign_savedfile;
		this.sign_ok1 = sign_ok1;
		this.sign_ok2 = sign_ok2;
		this.sign_ok3 = sign_ok3;
		this.sign_ok4 = sign_ok4;
		this.sign_cdate = sign_cdate;
		this.sign_memo = sign_memo;
		this.sign_sdate = sign_sdate;
	}
	
	
}