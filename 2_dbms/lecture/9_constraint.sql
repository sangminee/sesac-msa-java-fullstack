insert into dept 
values(10, 'test', 'test'); -- �̹� �����ϴ� �������̱� ������ ���Ἲ ���� 

-- p.303
select * from user_constraints;
create table test01(
    name varchar2(10) not null
);
create table test02(
    name varchar2(10) check(name is not null)
);
create table test03(
    name varchar2(10) check(name is not null), 
    constraint ck_mycheck check(name is not null)
);

-- p.305
select constraint_name, constraint_type, table_name
from user_constraints;

-- p.307
-- �����ȣ�� ������� null ������ �����ϱ� 
insert into emp02 values(null, null, '���', sysdate , 20); -- ��� �Ұ��� >> ���� ���� �� �Ŵ� ���� �߿��� 
select * from emp02;

create table emp02(
    empno number(4) NOT NULL,
    ename varchar2(10) NOT NULL,
    job varchar2(9),
    deptno number(2)
);
-- emp02�� not null �������� ���Ǳ�
desc emp02;
insert into emp02
values (1000, '����', '���', 30);
select *from emp02;

-- p.312
-- unique ��������
create table emp03(
    empno number(4) unique,
    ename varchar2(10) NOT NULL,
    job varchar2(9),
    deptno number(2)
);
insert into emp03 values (1000, '����', '���', 30);
insert into emp03 values (1000, 'ȫ�浿', '����', 30); -- ORA-00001: ���Ἲ ���� ����(TESTER1.SYS_C008263)�� ����
insert into emp03 values (null, '���߱�', '����', 30); 
insert into emp03 values (null, '�̼���', '����', 30);
select * from emp03;
-- unique = primary key - not null; 

select * from user_indexes;

-- �������� �̸��� ����ؼ� ���̺� �����ϱ� 
create table emp04(
    empno number(4) CONSTRAINT EMP04_EMPNO_UK UNIQUE,
    ename varchar2(10) CONSTRAINT EMP04_ENAME_NN NOT NULL,
    job varchar2(9),
    deptno number(9)
);
-- �������� ���Ǳ�
select constraint_name, constraint_type, table_name
from user_constraints
where table_name in('EMP04');

-- ������ ��� ��ȣ�� ��� ���� �߰��ϱ� 
insert into emp04 values (1000, '����', '���', 30);
insert into emp04 values (1000, 'ȫ�浿', '����', 20); -- ���Ἲ ���� ����(TESTER1.EMP04_EMPNO_UK)�� ����

-- 6. ������ ������ ���� PRIMARY KEY ��������
create table emp05(
    empno number(4) CONSTRAINT EMP05_EMPNO_UK PRIMARY KEY,
    ename varchar2(10) CONSTRAINT EMP05_ENAME_NN NOT NULL,
    job varchar2(9),
    deptno number(9)
);
-- ������ ��� ��ȣ�� ��� ���� �߰��ϱ� 
insert into emp05 values (1000, '����', '���', 30);
insert into emp05 values (1000, 'ȫ�浿', '����', 20); -- ���Ἲ ���� ����(TESTER1.EMP05_EMPNO_UK)�� ����
insert into emp05 values (NULL, '�̼���', '����', 10); -- NULL�� ("TESTER1"."EMP05"."EMPNO") �ȿ� ������ �� �����ϴ�

-- �������� ���Ǳ�
desc user_constraints;
select constraint_name, constraint_type, table_name
from user_constraints
where table_name in('DEPT');

-- ���������� ������ �÷� ���Ǳ�
select constraint_name, table_name, column_name
from user_cons_columns
where table_name in('DEPT');

-- p.325
-- ���ο� ����� �������� �ʴ� 50�� �μ��� �Ҽӽ�Ű��
insert into emp05 values (1010, 'ȫ�浿', '���', 50);

-- p.326
-- �ܷ�Ű ���������� �־� ���̺� �����ϱ� 
create table emp06(
    empno number(4) CONSTRAINT EMP06_EMPNO_UK PRIMARY KEY,
    ename varchar2(10) CONSTRAINT EMP06_ENAME_NN NOT NULL,
    job varchar2(9),
    deptno number(9) CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT(DEPTNO)
);

-- p.328
create table emp07(
    empno number(4) CONSTRAINT EMP07_EMPNO_UK PRIMARY KEY,
    ename varchar2(10) CONSTRAINT EMP07_ENAME_NN NOT NULL,
    sal number(7,2) CONSTRAINT EMP07_SAL_CK CHECK(SAL BETWEEN 500 AND 5000),
    gender varchar2(1) CONSTRAINT EMP07_GENDER_CK CHECK(GENDER IN('M','F'))
);

-- p.330 
create table emp07(
    depno number(2) primary key,
    dname varchar2(14),
    loc varchar2(13) default '����'
);

insert into dept01 values (10, '�渮��');

-- 10. ���̺� ���� ������� �������� �����ϱ�
create table emp07(
    empno number(4),
    ename varchar2(10) NOT NULL,
    job varchar2(9),
    deptno number(2),
    
    primary key(empno),
    unique(job),
    foreign key (deptno) references dept (deptno)
);
-- �⺻ Ű�� ����Ű�� �����ϴ� ���
create table member01(
    name varchar2(10),
    address varchar2(30),
    hphone varchar2(16),
    
    constraint MEMBER01_COMBO_PK primary key (name, hphone)
);

-- 11. �������� �����ϱ� 
alter table emp01
add constraint EMP01_EMPNO_PK primary key(empno);

alter table emp01
modify ename constraint EMP01_EMPNO_NN not null;

alter table emp01
drop constraint EMP01_EMPNO_NN;

-- 12. ���������� ��Ȱ��ȭ�� CASCADE

alter table emp01
disable constraint emp01_deptno_fk;

-- cascade �ɼ��� �����Ͽ� �⺻ Ű ���������� ��Ȱ��ȭ 
alter table dept01
disable primary key casade;

-- �⺻ Ű �ɾ������� ���� 
alter table dept01
drop primary key; -- ��� ���̺��� �ܷ� Ű���� �����ϰ� �ֱ� ������ ���� X 

alter table dept01
drop primary key casade; 
