create user survey IDENTIFIED by 1234;
grant connect, dba, resource to survey;

create table member(
  id varchar2(20),
  pw varchar2(20),
  nick varchar2(20)
);