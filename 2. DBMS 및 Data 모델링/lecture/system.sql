create user tester1
Identified by 1234
account unlock;

-- �н����� �ٲٱ�
alter user tester1
Identified by 1234;

-- ����� tester1�� �⺻ ���̺����̽��� users�� �����ϰ�, �ӽ� ���̺����̽��� temp�� ������. 
-- ���̺����̽��� Oracle �����ͺ��̽����� ������ �� �ӽ� ������ ����Ҹ� �����ϴ� �� ����
alter user tester1
default tablespace users
temporary tablespace temp;

-- ����� tester1�� ���� users ���̺����̽��� ���� �Ҵ緮(���丮�� �ѵ�)�� ���������� ������. �̷��� �ϸ� ����� tester1�� users ���̺����̽��� �����͸� ���������� ������ �� ����
alter user tester1
quota unlimited on users;

select username from dba_users
where username like '%TESTER%';

-- ���� �ο� 
grant connect, 
             resource,
             create session, 
             create table,
             create procedure,
             create trigger,
             create view,
             create sequence
       to tester1;
       
    