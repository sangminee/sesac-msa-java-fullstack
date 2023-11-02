create user tester2
identified by 1234;

grant connect, resource to tester2;

-- create table 권한 부여하기 

-- conn sys
grant create table to tester2;

-- conn tester2
create table emp01(
  empno number(4),
  ename varchar2(10),
  job varchar2(9),
  deptno number(2)
);

-- with admin option
-- p.515
-- conn system 
DROP USER tester3 CASCADE;
create user tester3 identified by 1234;
grant connect session to tester3 with admin option;
-- conn tester3
show user;
-- 
grant create session to tester2; -- ORA-01031: 권한이 불충분합니다

-- conn system 
-- 사용자 생성과 권한 부여 
create user tester4 identified by 1234;
grant connect session to tester4;



show user;
select * from dept; -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다

-- p.521 
-- conn tester1 
show user;
grant select on dept to tester2;

-- conn tester2
show user;
select * from dept; 
-- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
-- 객체의 소유자인 스키마를 지정하지 않았기 때문

-- p.522 

-- p. 533 
-- 3-1. 사전에 정의된 롤의 정의

-- system으로 접속하기 
show user;
-- 사용자 생성하여 접속하기 
create user tester5 identified by 1234;
-- 권한 부여하기
grant connect, resource to tester5;

-- conn sys
create role mrole;
-- 롤에 권한 부여하기
grant create session, create table, create view to mrole;
-- 사용자를 생성하여 롤 부여하기 
create user tester6 identified by 1234;
-- 사용자 생성하여 롤 부여하기 
grant mrole to tester6;
-- teste6 사용자로 접속해서 부여된 롤 확인하기 
select * from USER_ROLE_PRIVS;

-- conn system
show user;
create role mrole2;

-- conn tester1
-- 롤에 객체 권한 부여하기 
grant select on dept to mrole2;

-- conn system 
-- tester6 에게 롤 부여하기 




