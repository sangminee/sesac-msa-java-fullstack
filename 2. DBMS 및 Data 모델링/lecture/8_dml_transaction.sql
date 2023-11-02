-- 8��
-- conn tester1 
-- p.282
-- �μ� ������ �����ϱ� ���� ���̺� �����ϱ�
create table dept01(
    deptno number(2),
    dname varchar2(14),
    loc   varchar2(13)
);

desc dept01;

-- �渮�θ� �Է��ϱ� 
insert into dept01
values (10, '�渮��', '����'); -- �̷������� ���� �ۼ��Ǹ� �ȵ� (Į���� ������ �ݵ�� �ʿ���)

-- �Ͻ������� NULL �� �����ϱ� 
insert into dept01(deptno, dname) values (20, '�׽�Ʈ');
select * from dept01;

insert into dept01 values (50, '�����');  -- ���� (�÷� �� ����� ��)

--- ���鹮�� �����ϱ� (���������δ� null�� �� - ����� Ȯ�����ִ� ���� �ʿ���)
insert into dept01 values (50, '��ȹ��','');
select * from dept01; 

-- 284
-- ��� ������ �����ϱ� ���� ���̺� ����
create table emp02(
    empno number(4),
    ename varchar2(10),
    job   varchar2(9),
    hiredate date,
    deptno number(2)
);
desc emp02;

insert into emp02
values (1001, '����', '���', '2015/03/01', 20);
select * from emp02;

insert into emp02
values(1002, '�ѿ���', '�븮', to_date('2014, 05, 01', 'YYYY, MM, DD'), 20);

select * from emp02;

-- SYSDATE �Լ��� ���� ��¥ �Է��ϱ� 
insert into emp02
values(7020, 'JERRY', 'SALESMAN', SYSDATE, 30);

select * from emp02;

-- 02. ���̺��� ������ �����ϴ� UPDATE ��
update dept01
set dname='�����2', loc='�λ�'
where deptno=10;

select * from dept01;

commit;
rollback; 

update dept01
set dname='�����2', loc='�λ�'; -- �������� ������ ��� �� �����

-- 03. ���̺��� ������ �����ϴ� delete ��
delete dept01
where deptno=10;
select * from dept01;

delete emp02;

select * from emp02;
savepoint a;
delete emp02 where empno = (select max(empno) from emp02);
savepoint b;
delete emp02 where empno = (select max(empno) from emp02);
savepoint c;
delete emp02 where empno = (select max(empno) from emp02);



