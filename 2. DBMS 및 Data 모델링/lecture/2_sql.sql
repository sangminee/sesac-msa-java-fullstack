--CONN ACE/1234;
SELECT AVG(salary) "Average"
  FROM employees;

SELECT ABS(-15) "Absolute"
  FROM DUAL; -- 관리자가 가지고 있는

-- 전체 테이블 가져오기 
SELECT * FROM TAB;

SELECT last_name, to_char(hire_date,'YYYY/MM/DD') as hire_date
FROM employees;

-- *은 최대한 쓰지 않고 원하는 칼럼만 가져오기 ! 
select * from employees;

-- employees 에서 이름 (last_name), 급여 (salary), 연봉 (salary*12 + salary*commission_pct)
select 
    last_name
    ,salary
    ,(salary * 12 + salary*nvl(commission_pct,0)) as annual_income
from employees;


--------------------------------------------------------------------------------
--CONN TESTER1/1234;
-- 대표절 
--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING
--ORDER BY : 정렬 

SELECT *
FROM   DEPT;

--   P.63 (데이터 정렬 x) 
select 
    empno
    ,ename
from emp;

-- p.64
select 
    empno
    ,sal
    ,sal*12
from emp;

-- p.68
SELECT ename, sal*12 + nvl(comm, 0) AS annsal FROM emp;
SELECT ename, sal*12 + nvl(comm, 0) AS "annsal" FROM emp;
SELECT ename, sal*12 + nvl(comm, 0) annsal FROM emp; -- 지양하기 
SELECT ename, sal*12 + nvl(comm, 0) "annsal" FROM emp;

--p.70
SELECT ename || '의 직급은 ' || JOB || '입니다.' AS 직급 FROM emp;

SELECT 'select * from' || TNAME || ';' FROM TAB;  

-- p.72
SELECT distinct deptno FROM emp;
SELECT unique deptno FROM emp;

-- p.73
select * from emp where sal >= 500;

-- p.75
select * from emp where deptno = 10;

-- p.76
-- 문자 데이터
select * from emp where ename='이문세';
-- 날짜 데이터
select * from emp where hiredate < TO_DATE('2005/01/01', 'YYYY/MM/DD');
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') as thistime from emp where rownum = 1;
-- dual 테이블 사용 
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') as thistime from dual;

-- p.77
-- and 
select * from emp where deptno=10 and job='과장';
-- or 
select * from emp where deptno=10 or job='과장';
-- not
select * from emp where not deptno=10;

--CONN ACE/1234;
-- 부서에 소속되지 않은 사원 출력 (employee table)
select * from employees;
-- null은 관계연산자에 사용하면 안됨 
select last_name, department_id
from employees 
where department_id is not null;
------------------------------------------

-- p.81
select * 
from emp 
where sal < 400 or sal >500;
select * 
from emp 
where comm=80 or comm=100 or comm=200;

-- p.83
-- between
select * 
from emp 
where 400 <= sal and sal <= 500;

select * 
from emp 
where sal between 400 and 500;

select * 
from emp 
where hiredate between to_date('2003/01/01', 'YYYY/HH/DD')
                    and to_date('2003/12/31', 'YYYY/HH/DD');
select * 
from emp 
where to_char(hiredate, 'YYYY') = 2003; -- 위의 함수를 쓰는 것이 좋음, 필드에 함수를 거는 것 지양 (좋지 않음)

-- p.85
-- in
select *
from emp
where comm in(80, 100, 200);
-- not in ,not between, not null
select *
from emp
where comm not in(80, 100, 200);
