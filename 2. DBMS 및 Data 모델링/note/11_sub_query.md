# 11장. 서브 쿼리 

- 서브 쿼리 : 다른 쿼리문에 삽입된 SELECT 문
    
    ```sql
    select ename, sal 
    from emp 
    where sal < (select sal from emp where ename = '조향기');
    ```
    

## 1. 서브 쿼리의 기본 개념

- 쿼리
    - 메인 쿼리 = 바깥 쿼리
    - 서브 쿼리
- 서브 쿼리
    - 서브 쿼리 안에 서브 쿼리 삽입 가능 (nesting)
        - 무제한 중첩 가능
    - 주로 하나의 레코드 값만 리턴해야 함
        - 대부분의 경우 Group by, having 사용 불가능
    - 서브 쿼리에서 SELECT 하지 않은 컬럼은 주 쿼리에서 사용할 수 없음

```sql
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
------------------------------------------------------
-- 평균 급여
select ename, sal
from emp
where sal > (select avg(sal) from emp);

-- 가장 많은 급여를 받고 있는 사람
select ename, sal
from emp
where sal >= (select max(sal) from emp);
```

```sql
-- 전체 사원의 평균 급여보다 적은 급여를 받고 있는 사원들의 이름을 출력
select last_name, salary
from employees
where salary < (select avg(salary) 
                from employees);
-----------------------------------------------------------------------
-- Mourgos의 직속 부하 사원 이름 모두 출력
select last_name
from employees
where manager_id = (select employee_id 
                    from employees 
                    where last_name = 'Mourgos');
-----------------------------------------------------------------------
-- 업무가 IT_PROG인 사원들의 평균 급여보다 적은 급여를 받는 사람들을 출력
select last_name
from employees
where salary < (select avg(salary) 
                from employees 
                where job_id = 'IT_PROG');
```

## 2. 다중 행 서브 쿼리

- 단일행 서브쿼리
    - 서브쿼리의 수행 결과가 오직 하나의 로우만을 반환하는 서브 쿼리
- 다중 행 연산자
    - **서브쿼리에서 반환되는 결과가 하나 이상인 경우 사용**
        - 반드시 다중행 연산자와 함께 사용해야 함
            
            
            | 종류 | 의미 |
            | --- | --- |
            | IN | 메인 쿼리의 비교 조건이 서브 쿼리의 결과 중에서 하나라도 일치하면 참임 |
            | ALL | - 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 모든 값이 일치하면 참임
            - 최대 값 이상 |
            | ANY | 최소 값 이상 출력 
            - 검색된 조건 중 하나 이상 만족. 찾아진 값에 대해 하나라도 크면 참 |
            | EXIST | 메인 쿼리의 비교 조건이 서브 쿼리의 결과 중에서 만족하는 값이 하나라도 존재하면 참임.  |

### 2-1. IN 연산자

```sql
-- 급여가 500을 초과하는 사원이 소속된 부서의 부서 번호 
select ename, sal 
from emp
where deptno in ( select distinct deptno
                  from emp
                  where sal > 500);

---------------------------------------------------------
select empno, ename, sal, deptno
from emp
where (deptno,sal) in (select deptno, max(sal)
                       from emp 
                       group by deptno);
```

### 2-2. ALL 연산자

```sql
-- 오류 발생
-- ' > ' 은 단일 행 비교 연산자로서, 
-- 서브 쿼리의 결과가 하나의 행으로 주어지는 경우에만 사용할 수 있기 때문에 
select ename, sal 
from emp
where sal > (select sal
             from emp
             where deptno = 30);

select ename, sal 
from emp
where sal > ALL (select sal   --  
                 from emp
                 where deptno = 30);
```

### 2-3. ANY 연산자

```sql
-- 30번 부서의 최소 급여보다 많은 급여를 받는 사원 출력
select ename, sal 
from emp
where sal > ANY (select sal
                 from emp
                 where deptno = 30);
```

### 2-4. EXISTS 연산자 (조건문)

- 상호 연관 쿼리
    - correlated query
    - 성능을 많이 떨어뜨리기 때문에 쓰지 않는 것이 좋음

## 3. 서브 쿼리를 이용하여 테이블을 생성하고, 데이터를 조작하기

### 3-1. 서브 쿼리로 테이블 생성하기

```sql
drop table emp02; -- 테이블 삭제 

create table emp02
as미
select * from emp;
```

- 원하는 컬럼으로 구성된 복제 테이블 생성하기

### 3-2. 테이블 구조만 복사하기

```sql
create table emp06
as 
select * from emp where 1=0; 

-- where 1=0; 조건은 항상 거짓임 | 테이블의 데이터는 가져오지 않고 구조만 복사하게 됨
```

### 3-3. 서브 쿼리로 데이터를 삽입하기

```sql
create table dept01
as 
select * from dept where 1=0; -- 빈 테이블 생성 

insert into dept01 
select * from dept; -- 데이터 삽입 

select * from dept01; -- 테이블 내용 살피기
```

### 3-4. 서브 쿼리를 이용한 데이터 변경 (p.417)

```sql
update dept01
set loc = (select loc
           from dept01
           where deptno = 20)
where deptno = 40;
```

### 3-5. 서브 쿼리를 이용한 데이터 삭제

```sql
delete from emp02
where deptno = ( select deptno
                 from dept
                 where dname = '영업부');
```