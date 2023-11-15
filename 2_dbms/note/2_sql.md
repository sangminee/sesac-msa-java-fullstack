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

### 2-5. LIKE 연산자와 와일드카드(%)

- LIKE 연산자는 검색하고자 하는 값을 정확히 모를 경우에도 검색 가능하도록 한 것
    
    ```sql
    -- 형식
    column_name LIKE pattern 
    ```
    
    - pattern에 와일드카드(%) 사용하기
        - % : 문자가 없거나, 하나 이상의 문자가 어떤 값이 와도 상관없음
            - 몇 개의 문자가 와도 상관 없음
        - _ : 하나의 문자가 어떤 값이 와도 상관없음
            - 단 하나의 문자에 대해서만 와일드 카드 역할을 함
        
        ```sql
        select * 
        from emp
        where ename Like '이%';
        
        select * 
        from emp
        where ename Like '%' || '문' || '%';
        
        select *
        from emp
        where ename like '_성%'; -- '_성' :: 값XX 
        ```
        
        - NOT LIKE 연산자

### 2-6. NULL을 위한 연산자

## 3. 정렬을 위한 ORDER BY 절

- 정렬 : 크기 순서대로 나열하는 것
    - 오름차순 (ascending)
    - 내림차순 (de-scending)
- ORDER BY 절의 정렬 방식  : ROW 을 정렬하기 위해 사용

|  | ASC (오름차순) | DESC (내림차순) |
| --- | --- | --- |
| 숫자 | 작은 값 부터  | 큰 값부터  |
| 문자 | 사전 순서 | 사전 반대 순서 |
| 날짜 | 빠른 날짜 | 늦은 날짜 |
| NULL | 가장 마지막에 나옴 | 가장 먼저 나옴  |

### 3-1. 오름차순 정렬을 위한 ASC

- order by 디폴드 값 (생략해도 사용 가능)

### 3-2. 내림차순 정렬을 위한 DESC

### 3-3. 정렬 방식에 여러 가지 조건을 제시하기

```sql
select hiredate, ename
from emp
order by hiredate desc, ename asc;
```

## 4. 집합 연산자

- UNION : 합집합 (중복 제거됨)
    - 칼럼 유형이 일치 해야함
- UNION ALL : 합집합 (중복 제거 안됨)
    - 중복 데이터가 없는 경우에 사용하는 것이 좋음 (UNION은 중복 제거 때문에 성능 저하됨)
- INTERSECT : 교집합
- MINUS : 차집합
    
    ```sql
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
    ```
    
    ```sql
    -- 1. set operator를 이용하여 job ID가 ST_CLERK을 포함하지 않는 부서의 ID를 출력
    select DEPARTMENT_ID from employees
    minus
    select DEPARTMENT_ID from employees where job_id = 'ST_CLERK' 
    order by DEPARTMENT_ID;
    
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
    select last_name, department_id, nvl(null,' ') as department_name from employees
    union
    select ' ' as dummy, department_id, department_name from departments;
    ```