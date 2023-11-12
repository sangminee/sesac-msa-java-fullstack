select deptno,job, avg(sal)
from emp
group by deptno, job;

select deptno,job, avg(sal)
from emp
group by rollup(deptno, job)
order by deptno, job; -- 마지막은 전체 집계 


select deptno, grouping(deptno), job, count(*), avg(sal) * 12
from emp
group by rollup(deptno, job)
order by deptno, job;

-- conn ace 
select last_name, level from employees; -- ORA-01788: CONNECT BY 구를 지정해 주십시오

select last_name, level from employees
connect by manager_id = prior employee_id;

select last_name, level from employees
start with manager_id is null     -- start with : 시작 행 지정
connect by manager_id = prior employee_id;

describe employees;

select EMPLOYEE_ID,
       MANAGER_ID,
       level,
       connect_by_root LAST_NAME as 대표,  
       connect_by_isleaf as 막내,
       SYS_CONNECT_BY_PATH(LAST_NAME, '/') as path,
       LPAD(' ', (level - 1) * 3) || LAST_NAME as LAST_NAME,
       prior LAST_NAME
from EMPLOYEES
start with MANAGER_ID is null
connect by MANAGER_ID = prior EMPLOYEE_ID
order siblings by EMPLOYEE_ID asc;

-- grouping sets 
-- conn tester1
select deptno, job, avg(sal)
from emp
group by deptno, job;

SELECT job, mgr, avg(sal)
FROM emp
GROUP BY job, mgr;

SELECT deptno, job, NULL, avg(sal)
FROM emp
GROUP BY deptno, job
UNION ALL
SELECT NULL, job, mgr, avg(sal)
FROM emp
GROUP BY job, mgr;

select deptno, job, mgr, avg(sal)
from emp
group by grouping sets ((deptno,job), (job,mgr));


-- with 절 
select 'sum', sum(sum_sal)
from (select deptno , sum(sal) as sum_sal, count(*) as cnt
      from emp
      group by deptno)
union all
select 'avg', sum_sal/cnt
from (select deptno , sum(sal) as sum_sal, count(*) as cnt
      from emp
      group by deptno);
      
with a as (select deptno , sum(sal) as sum_sal, count(*) as cnt
           from emp
           group by deptno)
select 'sum', sum(sum_sal)
from a
union all 
select 'avg', sum_sal/cnt
from a;

-- Multiple Column 서브쿼리
-- conn tester1
drop table fruits;
create table fruits(
    name varchar2(20),
    grade varchar2(1));

insert into fruits values('딸기', 'A');
insert into fruits values('딸기', 'B');
insert into fruits values('바나나', 'A');
insert into fruits values('바나나', 'B');
insert into fruits values('바나나', 'C');

select * from fruits;

CREATE TABLE purchases (
   name varchar2(20),
   grade varchar2(1));
INSERT INTO purchases VALUES ('딸기', 'A');
INSERT INTO purchases VALUES ('바나나', 'B');

-- purchases 에서 구매하지 않은 과일들을 출력
select * 
from fruits
where (name, grade) not in (select name, grade
                            from purchases);

-- scott 계정의 dept 테이블과 emp 테이블을 이용하여 
-- 각 부서별 최저 연봉을 받고 있는 사원의 이름(ename), 부서번호(deptno), 급여(sal)를 출력
select ename, deptno, sal
from emp
where (deptno, sal) in (select deptno, min(sal) 
                        from emp 
                        group by deptno);


drop table t_dept; 
drop table t_emp; 

create table t_dept(
    deptno number(2) constraint DEPT_DEPTNO_PK primary key not null,
    dname varchar2(30),
    loc varchar2(10));
    
create table t_emp(
   empno number(4) constraint EMPNO_PK primary key not null, 
   ename varchar2(30) not null,
   hp varchar2(11) unique,
   sal number constraint SAL_CK check(sal >= 100), 
   deptno number(2) constraint DEPNO_FK references t_dept(deptno) );
--------------------------------------------------------------

create table t_emp(
   empno  number(4)    constraint t_emp_empno_pk  primary key, 
   ename  varchar2(30) constraint t_emp_ename_nn  not null,
   hp     varchar2(11) constraint t_emp_hp_uq     unique,
   sal    number       constraint t_emp_sal_ch    check(sal >= 100), 
   deptno number(2)    constraint t_emp_deptno_nn references t_dept(deptno) );
-----------------------------------------------------
-- constraint table level로 선언
create table t_dept(
    deptno number(2),
    dname varchar2(30),
    loc varchar2(10), 
    constraint t_dept_deptno_pk primary key (deptno), 
    constraint t_dept_dname_ck  check(dname is not  null) -- not null은 check로 
);
create table t_emp(
   empno  number(4), 
   ename  varchar2(30),
   hp     varchar2(11),
   sal    number, 
   deptno number(2),
   
   constraint t_emp_empno_pk  primary key (empno),
   constraint t_emp_ename_nn  check(ename is not null),
   constraint t_emp_hp_uq     unique(hp), 
   constraint t_emp_sal_ch    check(sal >= 100),
   constraint t_emp_deptno_nn foreign key(deptno) 
                              references t_dept(deptno)
);

-- conn ace
create table members(
userid varchar2(20) primary key,
userpw varchar2(256)
);

insert into members
values ('xci', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db');
commit;

alter table members
add (name varchar2(20));
update members 
set name='이상민'
where userid='xci';
commit;

update members 
set userpw='d760688da522b4dc3350e6fb68961b0934f911c7d0ff337438cabf4608789ba94ce70b6601d7e08a279ef088716c4b1913b984513fea4c557d404d0598d4f2f1'
where userid='xci';
commit;

SELECT userid, name FROM members WHERE userid ='xci' and userpw='d404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db';