
create view testview 
as 
select ename, sal from emp;
select * from testview;

-- p.434
create table emp_copy
as 
select * from emp;

-- p. 436
-- 30번 부서에 소속된 사원 정보 출력하는 뷰 정의하기 
create view emp_view30
as 
select empno, ename, deptno
from emp_copy
where deptno = 30;

--30번 부서에 소속된 사원 정보를 출력하는 뷰 사용
select * from emp_view30;


select * from tab; -- view도 나옴

insert into emp_view30
values(1111, 'aaaa', 30);

select * from emp_view30;
select * from emp_copy;

select empno, ename, deptno
from emp_copy;
select * from dept;

create view emp_view_dept
as
select e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
from emp_copy e 
join dept d
on e.deptno = d.deptno;
select * from emp_view_dept;

drop view emp_view_dept; -- 휴지통에 존재 x >> 쿼리문이기 때문에 

-- 이미 존재하는 뷰
create view emp_view30
as 
select empno, ename, deptno
from emp_copy
where deptno = 30;

-- 덮어쓰기 
create OR REPLACE view emp_view30
as 
select empno, ename, deptno
from emp_copy
where deptno = 30;

create or replace FORCE view employees_view
as 
select empno, ename, deptno
from employees
where deptno = 30; -- 경고: 컴파일 오류와 함께 뷰가 생성되었습니다.

select view_name, text
from user_view;

create or replace NOFORCE view existtable_view
as 
select empno, ename, deptno
from employees
where deptno = 30; -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다

create or replace view existtable_view
as 
select empno, ename, deptno
from employees
where deptno = 30; -- ORA-00942: 테이블 또는 뷰가 존재하지 않습니다

-- p.453
-- 30번 부서에 소속된 사원을 조회하는 뷰 정의 
create or replace view emp_view30
as 
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30;

select * from emp_view30;

update emp_view30 
set deptno =20
where sal >= 300;

select * from emp_copy;
rollback; -- 되돌리기 

-- p.454
create or replace view view_chk30
as 
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30 WITH CHECK OPTION;

select * from view_chk30;

-- 조건에 해당하는 부분 수정 불가능
-- ORA-01402: 뷰의 WITH CHECK OPTION의 조건에 위배 됩니다 
update view_chk30 
set deptno = 20
where sal >= 300; 

-- p.455
create table emp_copy2
as
select * from emp;

create or replace view view_chk30
as 
select empno, ename, sal, comm, deptno
from emp_copy2
where deptno = 30 WITH CHECK OPTION;

update view_chk30 set deptno=20
where sal>=300;

-- p.456
update view_chk30 set comm=1000;
select * from view_chk30;

create or replace view VIEW_READ30
as 
select empno, ename, sal, comm, deptno
from emp_copy2
where deptno = 30 WITH READ ONLY;

-- ORA-42399: 읽기 전용 뷰에서는 DML 작업을 수행할 수 없습니다
update VIEW_READ30 set comm=2000;

-- p.458
select empno, ename, hiredate
from emp
order by hiredate;

-- 뷰를 이용해서 제대로 순서 나오게 할 수 있음
-- 먼저 정렬 > 수행 

select ROWNUM, empno, ename, hiredate
from  (select empno, ename, hiredate
       from emp
       order by hiredate)
where ROWNUM <=5;

select B.*
from (select rownum as rnum, A.*
      from (select empno, ename, hiredate
            from emp 
            order by hiredate) A ) B
where rnum between 11 and 20;

-- paging 
-- 0부터 100 사이의 값을 찾아줌 : 랜덤하게 데이터를 입력하는 것처럼 보여줌
create table board (
  no number(5), -- 글번호
  title varchar2(34) not null, -- 글제목. NULL 을 허용치 않음
  re number(3) default 0, -- 조회수. 기본값 0
  regdate date default sysdate); -- 등록시간. 기본값 현재시간

-- 시퀀스 : like 번호표 
create sequence seq_board
 start with 1 increment by 1 nocache; -- 1 부터 시작 1 씩 증가 캐쉬없음.

-- 데이터 집어넣기 (PL/SQL 프로시저)
begin
  for i in 1..10002 loop
  insert into board
  values(seq_board.nextval,
  'With A Little Help From My Friends',
  trunc(dbms_random.value(0,100)),
  sysdate-((10002-i)/24/6));
  end loop;
  end;
  /

select no, title, re,
       to_char(regdate,'YYYY-MM-DD hh24:mi:ss') as regdate
from board
where regdate > sysdate - 1/24
order by no desc;

select count(*) from board;

define thisPage=1; 
define pageSize=5;

select rownum, no, title, re,
       to_char(regdate,'YYYY-MM-DD') as regdate
from board
where rownum between (&thisPage-1)*&pageSize+1 and &thisPage*&pageSize
order by no desc;

--old 4: where rownum between (&thisPage-1)*&pageSize+1
--new 4: where rownum between (1-1)*5+1
--old 5: and &thisPage*&pageSize
--new 5: and 1*5

select A.*
from (select no, title, re,
             to_char(regdate,'YYYY-MM-DD') as regdate
      from board
      order by no desc) A
where rownum between (&thisPage-1)*&pageSize+1 and &thisPage*&pageSize;

define thisPage=2;
select B.*
from (select rownum as rnum, A.*
      from (select no, title, re, to_char(regdate,'YYYY-MM-DD') as regdate
            from board
            order by no desc) A) B
where rnum between (&thisPage-1)*&pageSize+1 and &thisPage*&pageSize;

-- 수업 자료 
create table board (
no        number,      
title     varchar2(34) not null,
re        number(3) default 0,
regdate   date  default sysdate);

alter table board add constraint pk_board
primary key(no);

drop sequence seq_board;
create sequence seq_board
start with 1 increment by 1 nocache;

begin
  for i in 1..2000000 loop
    insert into board
    values(seq_board.nextval,
       'With A Little Help From My Friends',
       trunc(dbms_random.value(0,100)),
       sysdate-((1000000-i)/24/6));
    end loop;
  end;
/

set autot on
set timing on
col content noprint

select B.*
from   (select rownum as rnum, A.*
       from   (select no, title, re,
                       case to_char(regdate,'YYYY-MM-DD')
                       when to_char(sysdate,'YYYY-MM-DD')
                       then to_char(regdate,'HH24:MI:SS')
                       else to_char(regdate,'YYYY-MM-DD')
                       end as regdate
               from   board
               order  by no desc) A) B
where   rnum between (&thisPage-1)*&pageSize+1
and     &thisPage*&pageSize;

SELECT no, title, re,
       case to_char(regdate,'YYYY-MM-DD')
       when to_char(sysdate,'YYYY-MM-DD')
       then to_char(regdate,'HH24:MI:SS')
       else to_char(regdate,'YYYY-MM-DD')
       end as regdate
from   board
order  by no desc
OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY;

commit;

-- new
create table myno (
no        number);

begin 
    for i in 1..100 loop
        insert into myno values(i);
    end loop;
end;
/
commit;

select no, deptno, job, sumsal
from (select deptno, job, sum(sal) as sumsal 
      from emp
      group by deptno, job
      order by 1, 2)
      cross join (select no from myno where no <= 3 order by no);
      
select *
from (select deptno, job, sum(sal) as sumsal
      from emp
      group by deptno, job
      order by 1, 2)
      cross join (select no from myno where no <=3 order by no)
group by decode(no, 1, deptno, 2, deptno), 
         decode(no,
         1, job)
order by 1, 2;