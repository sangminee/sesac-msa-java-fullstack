drop table emp03; -- 휴지통에 남아 있음
drop table emp03 purge; -- 완전 삭제        

select * from dept01;

-- p.263
-- 사원테이블에 날짜 타입을 가지는 birth 컬럼 추가하기
alter table emp01
add(birth date);

-- 컬럼 변경
-- 사원 이름 컬럼 크기 변경하기
alter table emp01
modify ename varchar2(30);

-- 컬럼 제거 
-- 사원 테이블에서 이름 컬럼 제거하기 
alter table emp01
drop column ename;

-- set unused 
-- 사원 테이블에서 사원번호 제거하기
alter table emp01
drop unused columns; 

-- 테이블 명 변경W
rename emp02 to emp01;
rename emp01 to emp02;

-- p.267
-- 테이블 제거 
drop table emp02;

-- p.268
-- conn ace
show user;
select * from all_tables; -- 모든 테이블을 볼 수 있는
select owner, table_name from all_tables;

-- conn system
select owner, table_name from dba_tables; -- 시스템 운영하는데 필요한 시스템 뷰

-- 기존에 사용하던 테이블의 모든 로우를 제거하기 위해 'TRUNCATE'가 제공됨
-- TRUNCATE table_name;
-- 테이블 복제
-- conn tester1
create table emp11
as 
select * from emp;

truncate table emp11;
select * from emp11;

select * from tab; -- 테이블이 여전히 존재하는 것 확인 가능


