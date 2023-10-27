SELECT deptno, ROUND(sal, 3)
FROM emp;

SELECT SUM(sal) as "급여 총액"
      ,ROUND(AVG(sal)) as "급여 평균"
      ,MAX(sal) as "최대급여"
      ,MIN(sal) as "최소급여"
FROM emp;

-- 가장 최근에 입사한 사람과 가장 나중에 입사한 사람의 입사일 차이 
SELECT to_date(MAX(hiredate), 'YY/MM/DD')
       ,to_date(MIN(hiredate), 'YY/MM/DD')
FROM emp;

-- p.164
SELECT comm
FROM emp;

SELECT SUM(comm) AS "커미션 총액"
FROM emp;

-- p.165 
-- 최대 급여 구하기
select max(sal) from emp;
-- 최대 급여와 최대 급여를 받는 사원의 이룸
-- 오류 발생 : 단일 그룹의 그룹 함수가 아닙니다.
-- 오류 이유 : 그룹 함수의 결과 값은 한 개의 로우로 산출되는데 ename은 총 14개의 로우가 산출되기 때문
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

-- 잘못 사용된 예제 
SELECT DEPTNO, ENAME, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;

-- p.170
SELECT deptno, SUM(sal) AS "급여 총액" , AVG(sal) AS "급여 평균"
FROM emp
GROUP BY deptno;

-- p.171 
SELECT deptno, MAX(sal) AS "최대 급여" , MIN(sal) AS "최소 급여"
FROM emp
GROUP BY deptno;

-- p.172
SELECT deptno, COUNT(*) "부서별 사원수" , COUNT(comm) "커미션 받는 사원수" 
FROM emp
GROUP BY deptno;

-- p.173 
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

