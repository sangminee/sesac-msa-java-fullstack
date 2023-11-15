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

SELECT LENGTH('Oracle'), LENGTH('����Ŭ')
FROM DUAL;
SELECT LENGTHB('Oracle'), LENGTHB('����Ŭ')
FROM DUAL;

-- p.125
select SUBSTR('welcome to Oracle', 4, 3) from DUAL; -- 4��° ���ں��� 3���� ���� 
select SUBSTR('welcome to Oracle', -4, 3) from DUAL; -- ���� 4��° ���ں��� 3���� ���� 
select SUBSTRB('����������Ŭ', 4, 3) from DUAL; -- ��� : ��
select INSTR('WELCOME TO ORACLE', 'O') from DUAL; -- 5
select INSTR('WELCOME TO ORACLE', 'O', 6, 2) from DUAL;  -- 12
select INSTR('�����ͺ��̽�', '��', 4, 1) from DUAL; -- 5
select INSTRB('�����ͺ��̽�', '��', 4, 1) from DUAL; -- 4
select LPAD ('Oracle', 20, '#') from DUAL; -- ##############Oracle
select RPAD ('Oracle', 20, '#') from DUAL; -- Oracle##############

-- p.131
SELECT * FROM DUAL;

SELECT sysdate, to_char(sysdate, 'YYYY-MM-DD') FROM dual;
SELECT hiredate, to_char(hiredate, 'YYYY/MM/DD DAY') FROM emp;
SELECT to_char(sysdate, 'YYYY/MM/DD, AM HH:MI:SS') FROM dual; -- ���� ��¥�� �ð��� ����ϱ� 

-- P.132 
select to_char(1230000), to_char(1230000, 'L999,999,999') 
from dual; -- 123000, ��1,230,000

select to_char(123456, '000000000')
       ,to_char(123456, '999,999,999')
from dual; -- 000123456,  123,456

-- p.133
-- 2007�� 4�� 2�Ͽ� �Ի��� ��� �˻� 
-- ���� ���� : ������ ���� ��ġ���� �ʱ� ���� 
select ename, hiredate
from emp
where hiredate=20070402;

-- ���� �ڵ�
select ename, hiredate
from emp
where hiredate= to_date(20070402, 'YYYYMMDD');

-- ���� ��ĥ�� �������� �˾ƺ��� 
-- ���� ���� : ������ ���� ��ġ X  
select sysdate-'2013/01/01'
from dual;

-- ���� �ڵ�
select trunc(sysdate-to_date('2013/01/01', 'YYYY/MM/DD'))
from dual;

-- p.135 
-- ���� ���� : '20,000' �� '10,000' �� �������̱� ����
select '20,000' - '10,000'
from dual;
-- ���� �ڵ�
select to_number('20,000','99,999') - to_number('10,000','99,999')
from dual;

-- P.136
SELECT to_char(SYSDATE, 'YYYY/MM/DD') FROM DUAL;
-- p.137
select to_char(SYSDATE-1, 'YYYY/MM/DD') ����
       ,to_char(SYSDATE, 'YYYY/MM/DD') ����
       ,to_char(SYSDATE+1, 'YYYY/MM/DD') ����
from dual;

-- p.138
-- Ư�� ��¥(DATE)�� ��(MONTH)�� �������� ������
select to_char(hiredate, 'YYYY/MM/DD') �Ի���
      ,to_char(trunc(hiredate, 'MONTH'), 'YYYY/MM/DD') �Ի���
from emp;

-- p.139
-- ��¥ ������ ���� �� ���ϱ� 
select ename, SYSDATE ����, to_char(hiredate, 'YYYY/MM/DD') �Ի���, 
        TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) �ٹ��޼�
from emp;

SELECT ename, to_char(hiredate, 'YYYY/MM/DD') �Ի���, 
            to_char(ADD_MONTHS(hiredate,6), 'YYYY/MM/DD') "�Ի� 6���� ��"
FROM emp;

-- p.141
SELECT to_char(SYSDATE, 'YYYY/MM/DD') ����, 
       to_char(NEXT_DAY(SYSDATE, '������'),'YYYY/MM/DD') ������ 
FROM DUAL;

SELECT ename, to_char(hiredate, 'YYYY/MM/DD') �Ի���, 
        to_char(LAST_DAY(hiredate),'YYYY/MM/DD') "������ ��¥" 
FROM emp;

-- p.142 


-- p.145
SELECT ename ,sal ,comm 
        ,COALESCE(comm, sal, 0)
FROM emp
ORDER BY deptno;

-- p.148
SELECT ename, deptno, decode(deptno, 10, '�渮��',
                                   20, '�λ��',
                                   30, '������',
                                   40, '�����') AS DNAME
FROM emp;
-- ü����ȸ�� �մϴ�. ������� Ȧ���� 'û��', ¦���� '�鱺'���� ���
-- ����� | ��
-- �̺��� | ��
select ename, decode(mod(empno,2),0, '�鱺'
                                 ,1, 'û��') as "��"
from emp;

-- �μ��� ���� ������ ���� �λ� 
-- 10�μ� : 20�ۼ�Ʈ �λ�
-- 20    : 10�ۼ�Ʈ �λ�
-- �׿�   : ����
select ename, sal as "���� ����", decode(deptno ,10 ,sal*1.2
                                               ,20 ,sal*1.1
                                                   ,sal) as "���� ����"
from emp;
-- searched case 
select ename, deptno, sal as "���� ����", 
        case deptno when 10 then sal*1.2
                    when 20 then sal*1.1
                            else sal
        end as "���� ����"
from emp;
-- simpled case 
select ename, deptno, sal as "���� ����", 
        case when deptno=10 then sal*1.2
             when deptno=20 then sal*1.1
                            else sal
        end as "���� ����"
from emp;



-- ���� ��� ���� 
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
