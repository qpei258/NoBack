
Drop table noback_member;
Drop table noback_notice;
Drop table noback_schedule;
Drop table noback_board;
Drop table noback_sign;
Drop table noback_messenger;
Drop table noback_alarm;


-- 사원 정보 테이블
CREATE TABLE noback_member (
	employee_num	    varchar2(20)    PRIMARY KEY,
    employee_password	varchar2(20)	default '0000',
	employee_name	    varchar2(20)	NOT NULL,
	employee_ssn	    varchar2(20)	NOT NULL,
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

-- 일정 테이블 (수정 후)
CREATE TABLE noback_schedule (
	schedule_num    	number          	primary key,
	schedule_title  	varchar2(100)	NOT NULL,
	schedule_start 	date            	default sysdate,
	schedule_end    	date            	default sysdate,
   	schedule_writer 	varchar2(50)    	NOT NULL,
    	schedule_level  	number          	NOT NULL,
	schedule_memo   	varchar2(500),
	schedule_allDay 	number(1)
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
	employee_num	    varchar2(20)	 NOT NULL,
	messenger_content	varchar2(600)   NOT NULL,
	messenger_date	    date	        default sysdate,
	messenger_receiver	varchar2(20)	        NOT NULL,
    constraint messenger_fk foreign key(employee_num)
        references noback_member(employee_num) on delete cascade
);

-- 메인 알람 테이블
CREATE TABLE noback_alarm (
    alarm_num       number  PRIMARY KEY,
	employee_num	varchar2(20),
	messenger	    number,
	sign	        number,
	schedule	    number,
    constraint alarm_fk foreign key(employee_num)
        references noback_member(employee_num) on delete cascade
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
    
insert into noback_member 
	values ('501508', '홍영감', '7020624', '부산 화명동', '개발부', '부장', 'yungam@gmail.com',
    '2', '010-1111-3333', 'yungam.jpg');

insert into noback_member 
	values ('000000','0000', '관리자', '000000', '부산 중구', '인사부', '과장', 'kanri@gmail.com',
    '4', '010-1111-1111', 'kanri.jpg');
    
    
select * from noback_member;

commit;

Drop table noback_messenger;
Drop table noback_alarm;
Drop table noback_member;