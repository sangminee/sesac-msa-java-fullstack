
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


-- p.410
-- 테이블 생성

drop table emp02;
create table emp02
as
select * from emp;

desc emp02; --테이블 구조 살피기 

select * from emp02;


create table emp03
as 
select empno, ename from emp;

select * from emp03;

-- p.414
create table emp06
as 
select * from emp where 1=0; -- where 1=0; 조건은 항상 거짓임 | 테이블의 데이터는 가져오지 않고 구조만 복사하게 됨 


create table dept01
as 
select * from dept where 1=0; -- 빈 테이블 생성 
insert into dept01 
select * from dept; -- 데이터 삽입 
select * from dept01; -- 테이블 내용 살피기 

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
                 where dname = '영업부');
select * from emp02;

-- p.423
-- 1. 1
-- 2. 3
-- 3. 3 
-- 4. 2
-- 5. 2 -- 다시보기 
-- 6. 2 (delete from emp)
-- 7. 
create table emp06
as
select * from emp;
-- 8. (다시 보기)
select ename, sal, job
from emp06
where sal > any (select sal from emp06 where job='과장'); 
-- 9. 
update emp06
set sal = (sal + 100)
where deptno = (select deptno from dept where loc = '인천');
-- 10. 
delete from emp06
where deptno = (select deptno from dept where dname = '경리부');
-- 11. 
select ename, deptno
from emp
where deptno = (select deptno from emp where ename = '이문세')
and ename != '이문세';
-- 12. 
select * 
from emp
where job = (select job from emp where ename = '이문세')
and ename != '이문세';
-- 13. 
select ename, sal
from emp
where sal > (select sal from emp where ename = '이문세');
-- 14. 
select ename, deptno
from emp
where deptno = (select deptno from dept where loc = '인천');
-- 15. 
select ename, sal, mgr
from emp
where mgr = (select empno from emp where ename = '감우성');
-- 16. 
-- in 연산자
select empno, ename, sal, deptno
from emp
where (deptno,sal) in (select deptno, max(sal)
                       from emp 
                       group by deptno)
order by deptno;

-- exists 연산자 
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
                 where job = '과장');
-- 18. 
select ename, sal, job
from emp
where sal > all (select distinct sal
                 from emp
                 where job = '과장')
and job != '과장';