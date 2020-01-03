create user survey IDENTIFIED by 1234;
grant connect, dba, resource to survey;

/*사용자 테이블*/
create table member(
  id varchar2(20),
  pw varchar2(20),
  nick varchar2(20),
  point number DEFAULT 0
);

insert into member values('1','1','1');

/*게시판(설문조사) 테이블*/
create table board(
  num NUMBER,
  title varchar2(4000),
  code varchar2(4000),
  hashtag varchar2(4000),
  deadline DATE,
  createDate DATE default sysdate,
  hit number DEFAULT 0,
  point number,
  nick varchar2(4000)
);
create SEQUENCE board_num;

/*설문조사 투표 결과 테이블*/
create table vote(
  num number,
  result varchar2(4000)
);

/*댓글 테이블*/
create table reply (
  cNum number primary key not null,
  num NUMBER not null,
  cDate DATE default sysdate not null,
  nick varchar2(4000) not null,
  content varchar2(4000),
  depth number default 0,
  intent number default 0
);
create sequence reply_num;

/*등록한 설문조사 테이블*/
create table TakeSurvey(
  num NUMBER,
  nick varchar2(4000),
  title varchar2(4000),
  deadline DATE,
  hit number DEFAULT 0,
  point number 
);
create SEQUENCE TakeSurvey_num;

/*vote 테이블 추가*/
alter table vote add nick varchar2(4000);

/* TakeSurvey에 날짜 추가 */
alter table TakeSurvey add dt date default sysdate not null;

/*BOARD에 사진아이콘 추가*/
alter table BOARD add boardicon VARCHAR2(400);

/* TakeSurvey에 게시판 번호 추가 */
alter table TakeSurvey add bnum number;
