
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

