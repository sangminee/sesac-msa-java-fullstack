select job
       ,sum(decode(deptno, '10', sal)) as d10
       ,sum(decode(deptno, '20', sal)) as d20
       ,sum(decode(deptno, '30', sal)) as d30
       ,sum(sal) as total
from emp
group by job;

-- cross join 
select e.ename, e.deptno, d.deptno, d.dname
from emp e, dept d
order by ename;

-- EQUI JOIN (join�� = �� �� ��) 
select e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno
order by ename;

select e.ename, e.deptno, d.dname
from emp e inner join dept d
on e.deptno = d.deptno
order by ename;

-- NON EQUI JOIN : equi �̿��� ������ �� 
select e.ename  as �����
      ,e.sal   as �޿�
      ,s.grade as ���
from emp e, salgrade s
where s.losal <= e.sal and e.sal <= s.hisal;

select e.ename  as �����
      ,e.sal   as �޿�
      ,s.grade as ���
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

select e.ename  as �����
      ,e.sal   as �޿�
      ,s.grade as ���
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

-- OUTER JOIN (�ַ� LEFT, �ݴ��ʿ� (+) �߰�) 
-- ���μ� deptno�� null�� ���� 

-- (1) LEFT OUSER JOIN 
select e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno(+)  -- FROM �����ϴ� ������ �����ִ� ���� ����
order by ename;

select e.ename, e.deptno, d.dname
from emp e left join dept d
on e.deptno = d.deptno  -- FROM �����ϴ� ������ �����ִ� ���� ����
order by ename;

select e.ename, e.deptno, d.dname
from emp e right join dept d
on e.deptno = d.deptno  -- FROM �����ϴ� ������ �����ִ� ���� ����
order by ename;

-- 
select e.ename, e.deptno, d.dname
from emp e full outer join dept d
on e.deptno = d.deptno  -- FROM �����ϴ� ������ �����ִ� ���� ����
order by ename;

-- SELF JOIN 
-- ����� ���� �˾Ƴ��� 
select e.ename as ���
      ,m.ename as ����
from emp e, emp m
where e.mgr = m.empno;

-- Left Outer Self Join
select e.ename as ���
      ,m.ename as ����
from emp e, emp m
where e.mgr = m.empno(+);

-- ANSI cross join 
select e.ename, e.deptno, d.deptno, d.dname
from emp e cross join dept d;

-- natural join : ���α׷��� ������ �� ������ ������ ���� ���
-- �Ⱦ��� ���� ���� ���� 
select ename, dname
from emp natural join dept; 

select e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;

-- Threeways Join 

-- ����� | �μ��� | ��� 
select e.ename as �����
      ,nvl(d.dname, '���߷�') as �μ���
      ,s.grade as ���
from emp e, dept d, salgrade s
where e.deptno = d.deptno(+)
and   e.sal between s.losal and s.hisal; 

select e.ename as �����
      ,d.dname as �μ���
      ,s.grade as ���
from emp e 
left join dept d 
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;  