drop table emp03; -- �����뿡 ���� ����
drop table emp03 purge; -- ���� ����        

select * from dept01;

-- p.263
-- ������̺� ��¥ Ÿ���� ������ birth �÷� �߰��ϱ�
alter table emp01
add(birth date);

-- �÷� ����
-- ��� �̸� �÷� ũ�� �����ϱ�
alter table emp01
modify ename varchar2(30);

-- �÷� ���� 
-- ��� ���̺��� �̸� �÷� �����ϱ� 
alter table emp01
drop column ename;

-- set unused 
-- ��� ���̺��� �����ȣ �����ϱ�
alter table emp01
drop unused columns; 

-- ���̺� �� ����W
rename emp02 to emp01;
rename emp01 to emp02;

-- p.267
-- ���̺� ���� 
drop table emp02;

-- p.268
-- conn ace
show user;
select * from all_tables; -- ��� ���̺��� �� �� �ִ�
select owner, table_name from all_tables;

-- conn system
select owner, table_name from dba_tables; -- �ý��� ��ϴµ� �ʿ��� �ý��� ��

-- ������ ����ϴ� ���̺��� ��� �ο츦 �����ϱ� ���� 'TRUNCATE'�� ������
-- TRUNCATE table_name;
-- ���̺� ����
-- conn tester1
create table emp11
as 
select * from emp;

truncate table emp11;
select * from emp11;

select * from tab; -- ���̺��� ������ �����ϴ� �� Ȯ�� ����


