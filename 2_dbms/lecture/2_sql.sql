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

--CONN ACE/1234;
select concat(last_name, first_name) from employees;
select last_name || first_name from employees;
---------------------------------------------------


--------------------------
------ conn tester1
--------------------------
-- p. 87
select * 
from emp
where ename like '이%';

select * 
from emp
where ename like '%' || '문' || '%';

select *
from emp
where ename like '_성%';

-- ORDER BY : 많이 쓰는 것이 좋은 것은 아님 
-- p. 94
select ename, sal
from emp
order by sal; 

select ename, sal
from emp
order by sal desc; 

select empno,ename
from emp
order by ename; 

-- p.97
select hiredate, ename
from emp
order by hiredate desc, ename asc;


--------------------------
------ conn ACE
--------------------------
-- 1. 
select last_name, salary, job_id
from employees
where salary >= 10000 and job_id like '%MAN%';

-- 2.
select last_name, salary, job_id
from employees
where salary >= 10000 or job_id like '%MAN%';

-- 3.
select last_name, job_id
from employees
where job_id not in ('IT_PROG', 'ST_CLERK', 'SA_REP');

-- 4.
select last_name, commission_pct
from employees
where commission_pct is not null;

-- 5. 
select last_name, job_id, salary
from employees
where job_id in ('ST_CLERK', 'SA_REP');

--------------------------
------ conn tester1 
--------------------------

select name from group_star;
select name from single_star;

select name from group_star
union
select name from single_star;

select name from group_star
intersect
select name from single_star;

-- 그룹 활동만 하는 가수 출력
select name from group_star
minus
select name from single_star;
-- 싱글 활동만 하는 가수 출력
select name from single_star
minus
select name from group_star;

--------------------------
------ conn ace 
--------------------------
-- 1. set operator를 이용하여 job ID가 ST_CLERK을 포함하지 않는 부서의 ID를 출력
select DEPARTMENT_ID from employees
minus
select DEPARTMENT_ID from employees where job_id = 'ST_CLERK' order by DEPARTMENT_ID;

-- 2. join 이 필요함 
select COUNTRY_ID from countries
minus 
select COUNTRY_ID from locations; -- departments table로 가서 location_id을 가지로 찾기 

-- 3. 부서가 10, 50 그리고 20의 순서로 부서의 업무리스트를 정렬하고 set operators를 이용하여 job ID와 department ID를 출력
select JOB_ID , DEPARTMENT_ID , 1 as A_DUMMY from employees where DEPARTMENT_ID = 10
union 
select JOB_ID , DEPARTMENT_ID , 2 A_DUMMY from employees where DEPARTMENT_ID = 50
union 
select JOB_ID , DEPARTMENT_ID , 3 A_DUMMY from employees where DEPARTMENT_ID = 20
order by A_DUMMY; -- order by 3; 과 결과 같음 

-- 4. 입사후 현재 업무와 같은 업무를 담당한 적이 있는 사원의 employee ID와 job ID를 출력
select EMPLOYEE_ID , JOB_ID from employees
intersect
select EMPLOYEE_ID , JOB_ID from job_history
order by EMPLOYEE_ID;

-- 소속된 부서에 상관없이 employees 테이블에 있는 모든 사원의 last name과 부서번호 
-- 소속된 사원에 상관없이 departments 테이블에 있는 모든 부서와 부서번호 부서 이름
select last_name, department_id, nvl(null,' ') as department_name
from employees
union
select ' ' as dummy, department_id, department_name
from departments;

