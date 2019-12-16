create user survey IDENTIFIED by 1234;
grant connect, dba, resource to survey;

create table member(
  id varchar2(20),
  pw varchar2(20),
  nick varchar2(20)
);

insert into member values('1','1','1');

create table board(
  num NUMBER,
  title varchar2(4000),
  code varchar2(4000),
  hashtag varchar2(4000),
  deadline DATE,
  createDate DATE default sysdate  ,
  hit number DEFAULT 0,
  point number,
  nick varchar2(4000)
);

create SEQUENCE board_num;


