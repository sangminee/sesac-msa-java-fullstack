# 4장. 그룹 함수

## 1. 그룹 함수

- 아무리 행이 많아도 단 한 개의 결과 값 만을 산출
- 단일 행 함수 : 각 행에 대해서 함수가 적
- 그룹 함수의 종류
    
    
    | 구분 | 설명 |
    | --- | --- |
    | SUM | 누적 합계 |
    | AVG | 평균 |
    | COUNT | 총 개수 |
    | MAX | 최대값 |
    | MIN | 최소값 |
    | STDDEV | 표준편차 |
    | VARIANCE | 분산 |
    
    ```sql
    SELECT SUM(sal) as "급여 총액"
          ,ROUND(AVG(sal)) as "급여 평균"
          ,MAX(sal) as "최대급여"
          ,MIN(sal) as "최소급여"
    FROM emp;
    
    -- 가장 최근에 입사한 사람과 가장 나중에 입사한 사람의 입사일 차이 
    SELECT to_date(MAX(hiredate), 'YY/MM/DD')
           ,to_date(MIN(hiredate), 'YY/MM/DD')
    FROM emp;
    ```
    

### 1-1. 그룹 함수와 NULL 값

- 그룹 함수는 NULL 인 것을 제외하고 제외함

### 1-2. 그룹 함수와 단순 컬럼

- COUNT 함수는 NULL 값에 대해서 개수를 세지 않음
    
    ```sql
    -- 최대 급여 구하기
    select max(sal) from emp;
    
    -- 최대 급여와 최대 급여를 받는 사원의 이
    -- 오류 발생 : 단일 그룹의 그룹 함수가 아닙니다.
    -- 오류 이유 : 그룹 함수의 결과 값은 한 개의 로우로 산출되는데 
    --            ename은 총 14개의 로우가 산출되기 때문
    select ename, max(sal) 
    from emp;
    
    -- p.166
    SELECT COUNT(COMM) AS "커미션을 받는 사원의 수"
    FROM EMP;
    
    SELECT COUNT(*) AS "전체 사원의 수"
          ,COUNT(COMM) AS "커미션을 받는 사원의 수"
    FROM EMP;
    
    -- 직위 종류의 개수 출력
    select count(distinct job) as "업무수"
    from emp;
    ```
    

## 2. 데이터 그룹 : GROUP BY 절

- 특정 컬럼을 기준으로 컬럼 별로 최대 값과 같은 통계 데이터를 알고 싶은 경우
    - 집계 함수를 제외한 모든 컬럼은 group by에 적혀져야 함
    
    ```sql
    -- 잘못 사용된 예제 
    SELECT DEPTNO, ENAME, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO;
    
    -----------------------------------------------------------------
    SELECT deptno, SUM(sal) AS "급여 총액" , AVG(sal) AS "급여 평균"
    FROM emp
    GROUP BY deptno;
    
    SELECT deptno, MAX(sal) AS "최대 급여" , MIN(sal) AS "최소 급여"
    FROM emp
    GROUP BY deptno;
    
    SELECT deptno, COUNT(*) "부서별 사원수" , COUNT(comm) "커미션 받는 사원수" 
    FROM emp
    GROUP BY deptno;
    ```
    

## 3. 그룹 결과 제한 : HAVING 절

- Group by에 대한 조건
    - 그룹에 대해 제한할 때 사용
- GROUP BY → HAVING 순으로 실행
    - WHERE은 HAVING에 적을 수 있는데 적으면 안됨 (성능이 안 좋아짐)
        - group by, having, select → 실행 우선순위 파악 알기 쉽지 않음

```sql
-- 부서별 급여 평균이 500 이상인 부서번호와 급여 평균 구하기 
SELECT deptno, AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVG(sal)>=500;

-- 최대 급여가 500을 초과하는 부서에 대해서 최대 급여와 최소 급여 구하기 
SELECT DEPTNO, MAX(SAL) AS "최대 급여" , MIN(SAL) AS "최소 급여"
FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) > 500;

-- 사원을 제외하고 급여 총액이 1000이상인 직급별 급여 총액 구하기 
SELECT job ,COUNT(*) ,SUM(sal)
FROM emp
WHERE job NOT LIKE '%사원%'
GROUP BY job
HAVING SUM(sal) >= 1000
ORDER BY SUM(sal);
```