create user tester1
Identified by 1234
account unlock;

-- 패스워드 바꾸기
alter user tester1
Identified by 1234;

-- 사용자 tester1의 기본 테이블스페이스를 users로 설정하고, 임시 테이블스페이스를 temp로 설정함. 
-- 테이블스페이스는 Oracle 데이터베이스에서 데이터 및 임시 데이터 저장소를 관리하는 데 사용됨
alter user tester1
default tablespace users
temporary tablespace temp;

-- 사용자 tester1에 대한 users 테이블스페이스에 대한 할당량(스토리지 한도)을 무제한으로 설정함. 이렇게 하면 사용자 tester1은 users 테이블스페이스에 데이터를 무제한으로 저장할 수 있음
alter user tester1
quota unlimited on users;

select username from dba_users
where username like '%TESTER%';

-- 권한 부여 
grant connect, 
             resource,
             create session, 
             create table,
             create procedure,
             create trigger,
             create view,
             create sequence
       to tester1;
       
    