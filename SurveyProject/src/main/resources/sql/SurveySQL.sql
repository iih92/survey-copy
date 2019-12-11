create user survey IDENTIFIED by 1234;
grant connect, dba, resource to survey;

create table member(
  id varchar2(20),
  pw varchar2(20),
  nick varchar2(20)
);

// 테스트용 
create table board(
  num NUMBER,
  title varchar2(4000),
  code varchar2(4000)
);

create SEQUENCE board_num;



