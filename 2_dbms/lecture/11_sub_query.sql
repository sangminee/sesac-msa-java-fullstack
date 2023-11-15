
select ename, sal 
from emp 
where sal < (select sal from emp where ename = '�����');

-- �̹����� ���� �μ��� �Ҽӵ� ������� �̸�
select ename, deptno
from emp
where deptno = (select deptno
                from emp
                where ename = '�̹���');

-- �̹����� ���� �μ��� �ƴ� �Ҽ��� ��� ��� ���
select ename, deptno
from emp
where deptno <> (select deptno
                from emp
                where ename = '�̹���');
                
-- ��� �޿�
select ename, sal
from emp
where sal > (select avg(sal) from emp);

-- ���� ���� �޿��� �ް� �ִ� ���
select ename, sal
from emp
where sal >= (select max(sal) from emp);

-- �޿��� 500�� �ʰ��ϴ� ����� �Ҽӵ� �μ��� �μ� ��ȣ 
select ename, sal 
from emp
where deptno in ( select distinct deptno
                  from emp
                  where sal > 500);

-- 30�� �μ��� �ִ� �޿� ���ϱ� 
-- ���� �߻�
select ename, sal 
from emp
where sal > (select sal
             from emp
             where deptno = 30);
select ename, sal 
from emp
where sal > ALL (select sal
                 from emp
                 where deptno = 30);
                 
-- ANY 
-- 30�� �μ��� �ּ� �޿����� ���� �޿��� �޴� ��� ���
select ename, sal 
from emp
where sal > ANY (select sal
                 from emp
                 where deptno = 30);

-- EXISTS 
-- ��ȣ ���� ���� 
select *
from dept
where EXISTS (select *
              from emp
              where deptno = 30);


-- p.410
-- ���̺� ����

drop table emp02;
create table emp02
as
select * from emp;

desc emp02; --���̺� ���� ���Ǳ� 

select * from emp02;


create table emp03
as 
select empno, ename from emp;

select * from emp03;

-- p.414
create table emp06
as 
select * from emp where 1=0; -- where 1=0; ������ �׻� ������ | ���̺��� �����ʹ� �������� �ʰ� ������ �����ϰ� �� 


create table dept01
as 
select * from dept where 1=0; -- �� ���̺� ���� 
insert into dept01 
select * from dept; -- ������ ���� 
select * from dept01; -- ���̺� ���� ���Ǳ� 

-- p.417 
update dept01
set loc = (select loc
           from dept01
           where deptno = 20)
where deptno = 40;

drop table emp02 purge;
create table emp02
as
select * from emp;

select * from emp02;
delete from emp02
where deptno = ( select deptno
                 from dept
                 where dname = '������');
select * from emp02;

-- p.423
-- 1. 1
-- 2. 3
-- 3. 3 
-- 4. 2
-- 5. 2 -- �ٽú��� 
-- 6. 2 (delete from emp)
-- 7. 
create table emp06
as
select * from emp;
-- 8. (�ٽ� ����)
select ename, sal, job
from emp06
where sal > any (select sal from emp06 where job='����'); 
-- 9. 
update emp06
set sal = (sal + 100)
where deptno = (select deptno from dept where loc = '��õ');
-- 10. 
delete from emp06
where deptno = (select deptno from dept where dname = '�渮��');
-- 11. 
select ename, deptno
from emp
where deptno = (select deptno from emp where ename = '�̹���')
and ename != '�̹���';
-- 12. 
select * 
from emp
where job = (select job from emp where ename = '�̹���')
and ename != '�̹���';
-- 13. 
select ename, sal
from emp
where sal > (select sal from emp where ename = '�̹���');
-- 14. 
select ename, deptno
from emp
where deptno = (select deptno from dept where loc = '��õ');
-- 15. 
select ename, sal, mgr
from emp
where mgr = (select empno from emp where ename = '���켺');
-- 16. 
-- in ������
select empno, ename, sal, deptno
from emp
where (deptno,sal) in (select deptno, max(sal)
                       from emp 
                       group by deptno)
order by deptno;

-- exists ������ 
select empno, ename, sal, deptno
from emp e
where exists (select deptno, max(sal)
              from emp d
              group by deptno
              having d.deptno = e.deptno
              and max(sal) = e.sal)
order by deptno;

SELECT  empno, ename, sal, deptno
FROM    emp e
WHERE   sal = ( SELECT  max(sal)
                FROM    emp e2
                WHERE   e.deptno = e2.deptno
                GROUP   BY deptno );
                
-- 17. 
select deptno, dname, loc
from dept
where deptno in (select distinct deptno
                 from emp
                 where job = '����');
-- 18. 
select ename, sal, job
from emp
where sal > all (select distinct sal
                 from emp
                 where job = '����')
and job != '����';