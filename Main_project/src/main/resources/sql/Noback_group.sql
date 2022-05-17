-- 팀 프로젝트
-- 그룹웨어 시스템
--  테이블 총 7개

-- 사원 정보 테이블
CREATE TABLE noback_member (
	employee_num	    number          PRIMARY KEY,
	employee_name	    varchar2(20)	NOT NULL,
	employee_ssn	    number	        NOT NULL,
	employee_address	varchar2(100)	NOT NULL,
	employee_dep	    varchar2(30)	NOT NULL,
	employee_pos	    varchar2(20)	NOT NULL,
	employee_email	    varchar2(50)	NOT NULL,
	employee_level	    number	        default 0,
	employee_phone	    varchar2(20)	NOT NULL,
	employee_picture	varchar2(40)	NOT NULL
);

-- 공지사항 테이블
CREATE TABLE noback_notice (
	notice_num	        number	        PRIMARY KEY,
	notice_title	    varchar2(90)	NOT NULL,
	notice_content	    varchar2(1200)	NOT NULL,
	notice_writer	    varchar2(20)	NOT NULL,
	notice_date	        date	        default sysdate,
	notice_originfile	varchar2(60),
	notice_savedfile	varchar2(60)
);

-- 일정 테이블
CREATE TABLE noback_schedule (
	schedule_num	number	        PRIMARY KEY,
	schedule_date	date	        default sysdate,
	schedule_memo	varchar2(200)	NOT NULL,
	schedule_writer	varchar2(20)	NOT NULL,
	schedule_level	number	        NOT NULL
);

-- 자유게시판 테이블
CREATE TABLE noback_board (
	board_num	    number	        PRIMARY KEY,
	board_title	    varchar2(90)	NOT NULL,
	board_content	varchar2(1200)	NOT NULL,
	board_writer	varchar2(20)	NOT NULL,
	board_date	    date	        default sysdate
);

-- 결재 테이블
CREATE TABLE noback_sign (
	sign_num	    number	        PRIMARY KEY,
	sign_title	    varchar2(90)	NOT NULL,
	sign_content	varchar2(1200)	NOT NULL,
	sign_sender	    varchar2(20)	NOT NULL,
	sign_receiver	varchar2(20)	NOT NULL,
	sign_originfile	varchar2(60)	NOT NULL,
	sign_savedfile	varchar2(60)	NOT NULL,
	sign_ok	        number	        NOT NULL,
	sign_cdate	    date	        default sysdate,
	sign_memo	    varchar2(200),
	sign_sdate	    date
);

-- 메신저 테이블
CREATE TABLE noback_messenger (
	employee_num	    number	        NOT NULL,
	messenger_content	varchar2(600)   NOT NULL,
	messenger_date	    date	        default sysdate,
	messenger_receiver	number	        NOT NULL,
    constraint messenger_fk foreign key(employee_num)
        references Member(employee_num) on delete cascade
);

-- 메인 알람 테이블
CREATE TABLE noback_alarm (
    alarm_num       number  PRIMARY KEY,
	employee_num	number,
	messenger	    number,
	sign	        number,
	schedule	    number,
    constraint alarm_fk foreign key(employee_num)
        references Member(employee_num) on delete cascade
);

create sequence notice_seq
	increment  by 1
	start with 1
	minvalue 1
	maxvalue 999
	nocycle
	nocache;
    
create sequence board_seq
	increment  by 1
	start with 1
	minvalue 1
	maxvalue 999
	nocycle
	nocache;
    
create sequence sign_seq
	increment  by 1
	start with 1
	minvalue 1
	maxvalue 999
	nocycle
	nocache;
    
create sequence msg_seq
	increment  by 1
	start with 1
	minvalue 1
	maxvalue 999
	nocycle
	nocache;

insert into noback_member 
	values ('501509', '홍길순', '920725', '경남 양산시', '개발부', '신입사원', 'gilsun@gmail.com',
    '0', '010-1111-2222', 'gilsun.jpg');