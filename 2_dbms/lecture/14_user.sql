create user tester2
identified by 1234;

grant connect, resource to tester2;

-- create table ���� �ο��ϱ� 

-- conn sys
grant create table to tester2;

-- conn tester2
create table emp01(
  empno number(4),
  ename varchar2(10),
  job varchar2(9),
  deptno number(2)
);

-- with admin option
-- p.515
-- conn system 
DROP USER tester3 CASCADE;
create user tester3 identified by 1234;
grant connect session to tester3 with admin option;
-- conn tester3
show user;
-- 
grant create session to tester2; -- ORA-01031: ������ ������մϴ�

-- conn system 
-- ����� ������ ���� �ο� 
create user tester4 identified by 1234;
grant connect session to tester4;



show user;
select * from dept; -- ORA-00942: ���̺� �Ǵ� �䰡 �������� �ʽ��ϴ�

-- p.521 
-- conn tester1 
show user;
grant select on dept to tester2;

-- conn tester2
show user;
select * from dept; 
-- ORA-00942: ���̺� �Ǵ� �䰡 �������� �ʽ��ϴ�
-- ��ü�� �������� ��Ű���� �������� �ʾұ� ����

-- p.522 

-- p. 533 
-- 3-1. ������ ���ǵ� ���� ����

-- system���� �����ϱ� 
show user;
-- ����� �����Ͽ� �����ϱ� 
create user tester5 identified by 1234;
-- ���� �ο��ϱ�
grant connect, resource to tester5;

-- conn sys
create role mrole;
-- �ѿ� ���� �ο��ϱ�
grant create session, create table, create view to mrole;
-- ����ڸ� �����Ͽ� �� �ο��ϱ� 
create user tester6 identified by 1234;
-- ����� �����Ͽ� �� �ο��ϱ� 
grant mrole to tester6;
-- teste6 ����ڷ� �����ؼ� �ο��� �� Ȯ���ϱ� 
select * from USER_ROLE_PRIVS;

-- conn system
show user;
create role mrole2;

-- conn tester1
-- �ѿ� ��ü ���� �ο��ϱ� 
grant select on dept to mrole2;

-- conn system 
-- tester6 ���� �� �ο��ϱ� 




