--------------------------
------ conn tester1 
--------------------------

-- p.116
select 24 * 60 
from emp;
select 24 * 60 
from dual;

-- p.119
select -10, abs(-10) from dual;
select 34.5678, floor(34.5678) from dual;
select 34.5678, round(34.5678) from dual;
select 34.5678, round(34.5678, 2) from dual;

select trunc(34.5678, 2)
        ,trunc(34.5678, -1)
        ,trunc(34.5678)
from dual;

select mod(27,2), mod(27,5), mod(27,7)
from dual;

-- p.123
select 'welcome to Oracle'
    , upper('welcome to Oracle')
    , lower('welcome to Oracle')
    , initcap('welcome to Oracle')
from dual;

SELECT LENGTH('Oracle'), LENGTH('오라클')
FROM DUAL;
SELECT LENGTHB('Oracle'), LENGTHB('오라클')
FROM DUAL;

-- p.125
select SUBSTR('welcome to Oracle', 4, 3) from DUAL; -- 4번째 글자부터 3글자 추출 
select SUBSTR('welcome to Oracle', -4, 3) from DUAL; -- 뒤쪽 4번째 글자부터 3글자 추출 
select SUBSTRB('웰컴투오라클', 4, 3) from DUAL; -- 결과 : 컴
select INSTR('WELCOME TO ORACLE', 'O') from DUAL; -- 5
select INSTR('WELCOME TO ORACLE', 'O', 6, 2) from DUAL;  -- 12
select INSTR('데이터베이스', '이', 4, 1) from DUAL; -- 5
select INSTRB('데이터베이스', '이', 4, 1) from DUAL; -- 4
select LPAD ('Oracle', 20, '#') from DUAL; -- ##############Oracle
select RPAD ('Oracle', 20, '#') from DUAL; -- Oracle##############

-- p.131
SELECT * FROM DUAL;

SELECT sysdate, to_char(sysdate, 'YYYY-MM-DD') FROM dual;
SELECT hiredate, to_char(hiredate, 'YYYY/MM/DD DAY') FROM emp;
SELECT to_char(sysdate, 'YYYY/MM/DD, AM HH:MI:SS') FROM dual; -- 현재 날짜와 시간을 출력하기 

-- P.132 
select to_char(1230000), to_char(1230000, 'L999,999,999') 
from dual; -- 123000, ￦1,230,000

select to_char(123456, '000000000')
       ,to_char(123456, '999,999,999')
from dual; -- 000123456,  123,456

-- p.133
-- 2007년 4월 2일에 입사한 사원 검색 
-- 오류 이유 : 데이터 형이 일치하지 않기 때문 
select ename, hiredate
from emp
where hiredate=20070402;

-- 변경 코드
select ename, hiredate
from emp
where hiredate= to_date(20070402, 'YYYYMMDD');

-- 올해 며칠이 지났는지 알아보기 
-- 오류 이유 : 데이터 형이 일치 X  
select sysdate-'2013/01/01'
from dual;

-- 변경 코드
select trunc(sysdate-to_date('2013/01/01', 'YYYY/MM/DD'))
from dual;

-- p.135 
-- 오류 이유 : '20,000' 과 '10,000' 은 문자형이기 때문
select '20,000' - '10,000'
from dual;
-- 변경 코드
select to_number('20,000','99,999') - to_number('10,000','99,999')
from dual;

-- P.136
SELECT to_char(SYSDATE, 'YYYY/MM/DD') FROM DUAL;
-- p.137
select to_char(SYSDATE-1, 'YYYY/MM/DD') 어제
       ,to_char(SYSDATE, 'YYYY/MM/DD') 오늘
       ,to_char(SYSDATE+1, 'YYYY/MM/DD') 내일
from dual;

-- p.138
-- 특정 날짜(DATE)를 달(MONTH)을 기준으로 버리기
select to_char(hiredate, 'YYYY/MM/DD') 입사일
      ,to_char(trunc(hiredate, 'MONTH'), 'YYYY/MM/DD') 입사일
from emp;

-- p.139
-- 날짜 사이의 개월 수 구하기 
select ename, SYSDATE 오늘, to_char(hiredate, 'YYYY/MM/DD') 입사일, 
        TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) 근무달수
from emp;

SELECT ename, to_char(hiredate, 'YYYY/MM/DD') 입사일, 
            to_char(ADD_MONTHS(hiredate,6), 'YYYY/MM/DD') "입사 6개월 후"
FROM emp;

-- p.141
SELECT to_char(SYSDATE, 'YYYY/MM/DD') 오늘, 
       to_char(NEXT_DAY(SYSDATE, '수요일'),'YYYY/MM/DD') 수요일 
FROM DUAL;

SELECT ename, to_char(hiredate, 'YYYY/MM/DD') 입사일, 
        to_char(LAST_DAY(hiredate),'YYYY/MM/DD') "마지막 날짜" 
FROM emp;

-- p.142 


-- p.145
SELECT ename ,sal ,comm 
        ,COALESCE(comm, sal, 0)
FROM emp
ORDER BY deptno;

-- p.148
SELECT ename, deptno, decode(deptno, 10, '경리부',
                                   20, '인사과',
                                   30, '영업부',
                                   40, '전산부') AS DNAME
FROM emp;
-- 체육대회를 합니다. 사번으로 홀수는 '청군', 짝수는 '백군'으로 출력
-- 사원명 | 팀
-- 이병헌 | 팀
select ename, decode(mod(empno,2),0, '백군'
                                 ,1, '청군') as "팀"
from emp;

-- 부서에 따른 연봉의 차등 인상 
-- 10부서 : 20퍼센트 인상
-- 20    : 10퍼센트 인상
-- 그외   : 동결
select ename, sal as "올해 연봉", decode(deptno ,10 ,sal*1.2
                                               ,20 ,sal*1.1
                                                   ,sal) as "내년 연봉"
from emp;
-- searched case 
select ename, deptno, sal as "올해 연봉", 
        case deptno when 10 then sal*1.2
                    when 20 then sal*1.1
                            else sal
        end as "내년 연봉"
from emp;
-- simpled case 
select ename, deptno, sal as "올해 연봉", 
        case when deptno=10 then sal*1.2
             when deptno=20 then sal*1.1
                            else sal
        end as "내년 연봉"
from emp;



-- 연봉 등급 구분 
select ename, sal , decode(ceil(sal/300)-1 ,0, 'LOW'
                                   ,1, 'MID'
                                   ,2, 'HIGH'
                                     , 'TOP') as grade
from emp;

-- searched case 
select ename, sal , 
        case ceil(sal/300)-1 when 0 then 'LOW'
                             when 1 then 'MID'
                             when 2 then 'HIGH'
                             else 'TOP'
         end as grade
from emp;
select ename, sal , 
        case when sal<=300 then 'LOW'
             when sal<=600 then 'MID'
             when sal<=900 then 'HIGH'
                           else 'TOP'
         end as grade
from emp;
