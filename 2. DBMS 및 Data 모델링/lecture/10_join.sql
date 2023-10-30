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

-- EQUI JOIN (join에 = 가 들어간 것) 
select e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno
order by ename;

select e.ename, e.deptno, d.dname
from emp e inner join dept d
on e.deptno = d.deptno
order by ename;

-- NON EQUI JOIN : equi 이외의 조건이 들어간 
select e.ename  as 사원명
      ,e.sal   as 급여
      ,s.grade as 등급
from emp e, salgrade s
where s.losal <= e.sal and e.sal <= s.hisal;

select e.ename  as 사원명
      ,e.sal   as 급여
      ,s.grade as 등급
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

select e.ename  as 사원명
      ,e.sal   as 급여
      ,s.grade as 등급
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

-- OUTER JOIN (주로 LEFT, 반대쪽에 (+) 추가) 
-- 조인성 deptno을 null로 변경 

-- (1) LEFT OUSER JOIN 
select e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno(+)  -- FROM 나열하는 순서와 맞춰주는 것이 좋음
order by ename;

select e.ename, e.deptno, d.dname
from emp e left join dept d
on e.deptno = d.deptno  -- FROM 나열하는 순서와 맞춰주는 것이 좋음
order by ename;

select e.ename, e.deptno, d.dname
from emp e right join dept d
on e.deptno = d.deptno  -- FROM 나열하는 순서와 맞춰주는 것이 좋음
order by ename;

-- 
select e.ename, e.deptno, d.dname
from emp e full outer join dept d
on e.deptno = d.deptno  -- FROM 나열하는 순서와 맞춰주는 것이 좋음
order by ename;

-- SELF JOIN 
-- 사원의 멘토 알아내기 
select e.ename as 사원
      ,m.ename as 멘토
from emp e, emp m
where e.mgr = m.empno;

-- Left Outer Self Join
select e.ename as 사원
      ,m.ename as 멘토
from emp e, emp m
where e.mgr = m.empno(+);

-- ANSI cross join 
select e.ename, e.deptno, d.deptno, d.dname
from emp e cross join dept d;

-- natural join : 프로그램을 공부할 때 예제를 빠르게 쓸때 사용
-- 안쓰는 것이 제일 좋음 
select ename, dname
from emp natural join dept; 

select e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;

-- Threeways Join 

-- 사원명 | 부서명 | 등급 
select e.ename as 사원명
      ,nvl(d.dname, '대기발령') as 부서명
      ,s.grade as 등급
from emp e, dept d, salgrade s
where e.deptno = d.deptno(+)
and   e.sal between s.losal and s.hisal; 

select e.ename as 사원명
      ,d.dname as 부서명
      ,s.grade as 등급
from emp e 
left join dept d 
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;  