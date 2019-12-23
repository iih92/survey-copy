create user survey IDENTIFIED by 1234;
grant connect, dba, resource to survey;

create table member(
  id varchar2(20),
  pw varchar2(20),
  nick varchar2(20),
  point number
);

insert into member values('1','1','1');

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


create table vote(
  num number,
  result varchar2(4000)
);


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