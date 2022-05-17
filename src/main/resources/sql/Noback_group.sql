-- 팀 프로젝트
-- 그룹웨어 시스템
--  테이블 총 7개

-- 사원 정보 테이블
CREATE TABLE `Member` (
	`employee_num`	number	NOT NULL,
	`employee_name`	varchar2(20)	NULL,
	`employee_ssn`	number	NULL,
	`employee_address`	varchar2(100)	NULL,
	`employee_dep`	varchar2(30)	NULL,
	`employee_pos`	varchar2(20)	NULL,
	`employee_email`	varchar2(50)	NULL,
	`employee_level`	number	NULL,
	`employee_phone`	varchar2(20)	NULL,
	`employee_picture`	varchar2(40)	NULL
);

-- 공지사항 테이블
CREATE TABLE `Notice` (
	`notice_num`	number	NOT NULL,
	`notice_title`	varchar2(90)	NULL,
	`notice_content`	varchar2(1200)	NULL,
	`notice_writer`	varchar2(20)	NULL,
	`notice_date`	date	NULL,
	`notice_originfile`	varchar2(60)	NULL,
	`notice_savedfile`	varchar2(60)	NULL
);

-- 일정 테이블
CREATE TABLE `schedule` (
	`schedule_num`	number	NOT NULL,
	`schedule_date`	date	NULL,
	`schedule_memo`	varchar2(200)	NULL,
	`schedule_writer`	varchar2(20)	NULL,
	`schedule_level`	number	NULL
);

-- 자유게시판 테이블
CREATE TABLE `board` (
	`board_num`	number	NOT NULL,
	`board_title`	varchar2(90)	NULL,
	`board_content`	varchar2(1200)	NULL,
	`board_writer`	varchar2(20)	NULL,
	`board_date`	date	NULL
);

-- 결재 테이블
CREATE TABLE `sign` (
	`sign_num`	number	NOT NULL,
	`sign_title`	varchar2(90)	NULL,
	`sign_content`	varchar2(1200)	NULL,
	`sign_sender`	varchar2(20)	NULL,
	`sign_receiver`	varchar2(20)	NULL,
	`sign_originfile`	varchar2(60)	NULL,
	`sign_savedfile`	varchar2(60)	NULL,
	`sign_ok`	number	NULL,
	`sign_cdate`	date	NULL,
	`sign_memo`	varchar2(200)	NULL,
	`sign_sdate`	date	NULL
);

-- 메신저 테이블
CREATE TABLE `messenger` (
	`employee_num`	number	NOT NULL,
	`messenger_content`	varchar2(600)	NULL,
	`messenger_date`	date	NULL,
	`messenger_receiver`	number	NULL
);

-- 메인 알람 테이블
CREATE TABLE `alarm` (
	`employee_num`	number	NOT NULL,
	`messenger`	number	NULL,
	`sign`	number	NULL,
	`schedule`	number	NULL
);


-- 기본키, 외래키 추가
ALTER TABLE `Member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`employee_num`
);

ALTER TABLE `Notice` ADD CONSTRAINT `PK_NOTICE` PRIMARY KEY (
	`notice_num`
);

ALTER TABLE `schedule` ADD CONSTRAINT `PK_SCHEDULE` PRIMARY KEY (
	`schedule_num`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`board_num`
);

ALTER TABLE `sign` ADD CONSTRAINT `PK_SIGN` PRIMARY KEY (
	`sign_num`
);

ALTER TABLE `messenger` ADD CONSTRAINT `PK_MESSENGER` PRIMARY KEY (
	`employee_num`
);

ALTER TABLE `alarm` ADD CONSTRAINT `PK_ALARM` PRIMARY KEY (
	`employee_num`
);

ALTER TABLE `messenger` ADD CONSTRAINT `FK_Member_TO_messenger_1` FOREIGN KEY (
	`employee_num`
)
REFERENCES `Member` (
	`employee_num`
);

ALTER TABLE `alarm` ADD CONSTRAINT `FK_Member_TO_alarm_1` FOREIGN KEY (
	`employee_num`
)
REFERENCES `Member` (
	`employee_num`
);

