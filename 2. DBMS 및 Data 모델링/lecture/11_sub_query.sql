
select ename, sal 
from emp 
where sal < (select sal from emp where ename = '조향기');

-- 이문세와 같은 부서에 소속된 사원들의 이름
select ename, deptno
from emp
where deptno = (select deptno
                from emp
                where ename = '이문세');

-- 이문세가 속한 부서가 아닌 소속의 모든 사원 출력
select ename, deptno
from emp
where deptno <> (select deptno
                from emp
                where ename = '이문세');
                
-- 평균 급여
select ename, sal
from emp
where sal > (select avg(sal) from emp);

-- 가장 많은 급여를 받고 있는 사람
select ename, sal
from emp
where sal >= (select max(sal) from emp);

-- 급여가 500을 초과하는 사원이 소속된 부서의 부서 번호 
select ename, sal 
from emp
where deptno in ( select distinct deptno
                  from emp
                  where sal > 500);

-- 30번 부서의 최대 급여 구하기 
-- 오류 발생
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
-- 30번 부서의 최소 급여보다 많은 급여를 받는 사원 출력
select ename, sal 
from emp
where sal > ANY (select sal
                 from emp
                 where deptno = 30);

-- EXISTS 
-- 상호 연관 쿼리 
select *
from dept
where EXISTS (select *
              from emp
              where deptno = 30);

