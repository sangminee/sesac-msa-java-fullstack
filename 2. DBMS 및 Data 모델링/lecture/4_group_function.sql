SELECT deptno, ROUND(sal, 3)
FROM emp;

SELECT SUM(sal) as "�޿� �Ѿ�"
      ,ROUND(AVG(sal)) as "�޿� ���"
      ,MAX(sal) as "�ִ�޿�"
      ,MIN(sal) as "�ּұ޿�"
FROM emp;

-- ���� �ֱٿ� �Ի��� ����� ���� ���߿� �Ի��� ����� �Ի��� ���� 
SELECT to_date(MAX(hiredate), 'YY/MM/DD')
       ,to_date(MIN(hiredate), 'YY/MM/DD')
FROM emp;

-- p.164
SELECT comm
FROM emp;

SELECT SUM(comm) AS "Ŀ�̼� �Ѿ�"
FROM emp;

-- p.165 
-- �ִ� �޿� ���ϱ�
select max(sal) from emp;
-- �ִ� �޿��� �ִ� �޿��� �޴� ����� �̷�
-- ���� �߻� : ���� �׷��� �׷� �Լ��� �ƴմϴ�.
-- ���� ���� : �׷� �Լ��� ��� ���� �� ���� �ο�� ����Ǵµ� ename�� �� 14���� �ο찡 ����Ǳ� ����
select ename, max(sal) 
from emp;

-- p.166
SELECT COUNT(COMM) AS "Ŀ�̼��� �޴� ����� ��"
FROM EMP;
SELECT COUNT(*) AS "��ü ����� ��"
      ,COUNT(COMM) AS "Ŀ�̼��� �޴� ����� ��"
FROM EMP;

-- ���� ������ ���� ���
select count(distinct job) as "������"
from emp;

-- �߸� ���� ���� 
SELECT DEPTNO, ENAME, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;

-- p.170
SELECT deptno, SUM(sal) AS "�޿� �Ѿ�" , AVG(sal) AS "�޿� ���"
FROM emp
GROUP BY deptno;

-- p.171 
SELECT deptno, MAX(sal) AS "�ִ� �޿�" , MIN(sal) AS "�ּ� �޿�"
FROM emp
GROUP BY deptno;

-- p.172
SELECT deptno, COUNT(*) "�μ��� �����" , COUNT(comm) "Ŀ�̼� �޴� �����" 
FROM emp
GROUP BY deptno;

-- p.173 
-- �μ��� �޿� ����� 500 �̻��� �μ���ȣ�� �޿� ��� ���ϱ� 
SELECT deptno, AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVG(sal)>=500;

-- �ִ� �޿��� 500�� �ʰ��ϴ� �μ��� ���ؼ� �ִ� �޿��� �ּ� �޿� ���ϱ� 
SELECT DEPTNO, MAX(SAL) AS "�ִ� �޿�" , MIN(SAL) AS "�ּ� �޿�"
FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) > 500;

-- ����� �����ϰ� �޿� �Ѿ��� 1000�̻��� ���޺� �޿� �Ѿ� ���ϱ� 
SELECT job ,COUNT(*) ,SUM(sal)
FROM emp
WHERE job NOT LIKE '%���%'
GROUP BY job
HAVING SUM(sal) >= 1000
ORDER BY SUM(sal);

