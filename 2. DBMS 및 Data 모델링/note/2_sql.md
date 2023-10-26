# 2장. SQL의 기본

- 대표적인 Oracle 절

```sql
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
```

## 1. 데이터를 조회하기 위해 사용하는 SELECT 문

- select
    - 검색/조회 쿼리
    - 우리가 원하는 데이터 집합을 Oracle에게 요청하고 묘사하는 언어

### 1-1. 문장과 절

- 문장의 끝에 종결 문자 세미 콜론(;) 붙이기
- SQL 문에서 사용하는 명령어들은 대/소문자 구분하지 않음

### 1-2. 특정 데이터만 보기

### 1-3. 산술 연산자

- + , - , * , /

### 1-4. NULL도 데이터

- NULL : 알 수 없는 값을 의미
- NVL 함수 : NULL을 0 또는 다른 값으로 변환하기 위해 사용하는 함수

### 1-5. 컬럼 이름에 별칭 지정하기

- AS 로 컬럼에 별칭 부여하기
- AS 없이 컬럼에 별칭 부여하기
- 큰따옴표로 “ “로 별칭 부여하기

```sql
	SELECT ename, sal*12 + nvl(comm, 0) AS annsal FROM emp;
SELECT ename, sal*12 + nvl(comm, 0) AS "annsal" FROM emp;
SELECT ename, sal*12 + nvl(comm, 0) annsal FROM emp; -- 지양하기 
SELECT ename, sal*12 + nvl(comm, 0) "annsal" FROM emp;
```

### 1-6. Concatenation 연산자의 정의와 사용

- 여러 개의 컬럼을 연결할 때 사용하는

```sql
SELECT ename || '의 직급은 ' || JOB || '입니다.' AS 직급 
FROM emp;
```

### 1-7. DISTINCT 키워드

- 중복 데이터 삭제

```sql
SELECT distinct deptno 
FROM emp;

SELECT unique deptno 
FROM emp;
```

<br>

## 2. 특정 조건의 데이터만 조회하는 WHERE 절

```sql
select * 
from emp 
where sal >= 500;
```

### 2-1. 비교 연산자

- 다르다
    - <> , !=, ^=
- SQL에서 문자열이나 날짜는 반드시 단일 따옴표(single quotation)안에 표시해야 함
    - 문자 데이터 조회
        
        
    - 날짜 데이터 조회
        
        ```sql
        select * 
        from emp 
        where hiredate < TO_DATE('2005/01/01', 'YYYY/MM/DD');
        
        select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') as thistime 
        from emp 
        where rownum = 1;
        
        -- dual 테이블 사용 
        select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') as thistime 
        from dual;
        ```
        

### 2-2. 논리 연산자

- AND
    - 두 가지 조건 모두 만족해야 검색 가능
    
    ```sql
    select * 
    from emp 
    where deptno=10 and job='과장';
    ```
    
- OR
    - 한 가지 조건만 만족해도 검색 가능
    
    ```sql
    select * 
    from emp 
    where sal < 400 or sal >500;
    
    select * 
    from emp 
    where comm=80 or comm=100 or comm=200;
    ```
    
- NOT
    - 조건에 만족하지 못하는 것만 검색
        
        ```sql
        select * 
        from emp 
        where not deptno=10;
        
        --CONN ACE/1234; 
        -- 부서에 소속되지 않은 사원 출력 (employee table)
        select last_name, department_id
        from employees 
        where department_id is not null; -- null은 관계연산자에 사용하면 안됨 
        ```
        
- 논리 연산자의 다양한 활용

### 2-3. BETWEEN AND 연산자

```sql
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
```

### 2-4. IN 연산자

```sql
select *
from emp
where comm in(80, 100, 200);

-- not in ,not between, not null
select *
from emp
where comm not in(80, 100, 200);
```