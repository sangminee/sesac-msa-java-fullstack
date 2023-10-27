--CONN ACE/1234;
SELECT AVG(salary) "Average"
  FROM employees;

SELECT ABS(-15) "Absolute"
  FROM DUAL; -- �����ڰ� ������ �ִ�

-- ��ü ���̺� �������� 
SELECT * FROM TAB;

SELECT last_name, to_char(hire_date,'YYYY/MM/DD') as hire_date
FROM employees;

-- *�� �ִ��� ���� �ʰ� ���ϴ� Į���� �������� ! 
select * from employees;

-- employees ���� �̸� (last_name), �޿� (salary), ���� (salary*12 + salary*commission_pct)
select 
    last_name
    ,salary
    ,(salary * 12 + salary*nvl(commission_pct,0)) as annual_income
from employees;


--------------------------------------------------------------------------------
--CONN TESTER1/1234;
-- ��ǥ�� 
--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING
--ORDER BY : ���� 

SELECT *
FROM   DEPT;

--   P.63 (������ ���� x) 
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
SELECT ename, sal*12 + nvl(comm, 0) annsal FROM emp; -- �����ϱ� 
SELECT ename, sal*12 + nvl(comm, 0) "annsal" FROM emp;

--p.70
SELECT ename || '�� ������ ' || JOB || '�Դϴ�.' AS ���� FROM emp;

SELECT 'select * from' || TNAME || ';' FROM TAB;  

-- p.72
SELECT distinct deptno FROM emp;
SELECT unique deptno FROM emp;

-- p.73
select * from emp where sal >= 500;

-- p.75
select * from emp where deptno = 10;

-- p.76
-- ���� ������
select * from emp where ename='�̹���';
-- ��¥ ������
select * from emp where hiredate < TO_DATE('2005/01/01', 'YYYY/MM/DD');
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') as thistime from emp where rownum = 1;
-- dual ���̺� ��� 
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') as thistime from dual;

-- p.77
-- and 
select * from emp where deptno=10 and job='����';
-- or 
select * from emp where deptno=10 or job='����';
-- not
select * from emp where not deptno=10;

--CONN ACE/1234;
-- �μ��� �Ҽӵ��� ���� ��� ��� (employee table)
select * from employees;
-- null�� ���迬���ڿ� ����ϸ� �ȵ� 
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
where to_char(hiredate, 'YYYY') = 2003; -- ���� �Լ��� ���� ���� ����, �ʵ忡 �Լ��� �Ŵ� �� ���� (���� ����)

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
where ename like '��%';

select * 
from emp
where ename like '%' || '��' || '%';

select *
from emp
where ename like '_��%';

-- ORDER BY : ���� ���� ���� ���� ���� �ƴ� 
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

-- �׷� Ȱ���� �ϴ� ���� ���
select name from group_star
minus
select name from single_star;
-- �̱� Ȱ���� �ϴ� ���� ���
select name from single_star
minus
select name from group_star;

--------------------------
------ conn ace 
--------------------------
-- 1. set operator�� �̿��Ͽ� job ID�� ST_CLERK�� �������� �ʴ� �μ��� ID�� ���
select DEPARTMENT_ID from employees
minus
select DEPARTMENT_ID from employees where job_id = 'ST_CLERK' order by DEPARTMENT_ID;

-- 2. join �� �ʿ��� 
select COUNTRY_ID from countries
minus 
select COUNTRY_ID from locations; -- departments table�� ���� location_id�� ������ ã�� 

-- 3. �μ��� 10, 50 �׸��� 20�� ������ �μ��� ��������Ʈ�� �����ϰ� set operators�� �̿��Ͽ� job ID�� department ID�� ���
select JOB_ID , DEPARTMENT_ID , 1 as A_DUMMY from employees where DEPARTMENT_ID = 10
union 
select JOB_ID , DEPARTMENT_ID , 2 A_DUMMY from employees where DEPARTMENT_ID = 50
union 
select JOB_ID , DEPARTMENT_ID , 3 A_DUMMY from employees where DEPARTMENT_ID = 20
order by A_DUMMY; -- order by 3; �� ��� ���� 

-- 4. �Ի��� ���� ������ ���� ������ ����� ���� �ִ� ����� employee ID�� job ID�� ���
select EMPLOYEE_ID , JOB_ID from employees
intersect
select EMPLOYEE_ID , JOB_ID from job_history
order by EMPLOYEE_ID;

-- �Ҽӵ� �μ��� ������� employees ���̺� �ִ� ��� ����� last name�� �μ���ȣ 
-- �Ҽӵ� ����� ������� departments ���̺� �ִ� ��� �μ��� �μ���ȣ �μ� �̸�
select last_name, department_id, nvl(null,' ') as department_name
from employees
union
select ' ' as dummy, department_id, department_name
from departments;

