
create view testview 
as 
select ename, sal from emp;
select * from testview;

-- p.434
create table emp_copy
as 
select * from emp;

-- p. 436
-- 30�� �μ��� �Ҽӵ� ��� ���� ����ϴ� �� �����ϱ� 
create view emp_view30
as 
select empno, ename, deptno
from emp_copy
where deptno = 30;

--30�� �μ��� �Ҽӵ� ��� ������ ����ϴ� �� ���
select * from emp_view30;


select * from tab; -- view�� ����

insert into emp_view30
values(1111, 'aaaa', 30);

select * from emp_view30;
select * from emp_copy;

select empno, ename, deptno
from emp_copy;
select * from dept;

create view emp_view_dept
as
select e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
from emp_copy e 
join dept d
on e.deptno = d.deptno;
select * from emp_view_dept;

drop view emp_view_dept; -- �����뿡 ���� x >> �������̱� ������ 

-- �̹� �����ϴ� ��
create view emp_view30
as 
select empno, ename, deptno
from emp_copy
where deptno = 30;

-- ����� 
create OR REPLACE view emp_view30
as 
select empno, ename, deptno
from emp_copy
where deptno = 30;

create or replace FORCE view employees_view
as 
select empno, ename, deptno
from employees
where deptno = 30; -- ���: ������ ������ �Բ� �䰡 �����Ǿ����ϴ�.

select view_name, text
from user_view;

create or replace NOFORCE view existtable_view
as 
select empno, ename, deptno
from employees
where deptno = 30; -- ORA-00942: ���̺� �Ǵ� �䰡 �������� �ʽ��ϴ�

create or replace view existtable_view
as 
select empno, ename, deptno
from employees
where deptno = 30; -- ORA-00942: ���̺� �Ǵ� �䰡 �������� �ʽ��ϴ�

-- p.453
-- 30�� �μ��� �Ҽӵ� ����� ��ȸ�ϴ� �� ���� 
create or replace view emp_view30
as 
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30;

select * from emp_view30;

update emp_view30 
set deptno =20
where sal >= 300;

select * from emp_copy;
rollback; -- �ǵ����� 

-- p.454
create or replace view view_chk30
as 
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30 WITH CHECK OPTION;

select * from view_chk30;

-- ���ǿ� �ش��ϴ� �κ� ���� �Ұ���
-- ORA-01402: ���� WITH CHECK OPTION�� ���ǿ� ���� �˴ϴ� 
update view_chk30 
set deptno = 20
where sal >= 300; 

-- p.455
create table emp_copy2
as
select * from emp;

create or replace view view_chk30
as 
select empno, ename, sal, comm, deptno
from emp_copy2
where deptno = 30 WITH CHECK OPTION;

update view_chk30 set deptno=20
where sal>=300;

-- p.456
update view_chk30 set comm=1000;
select * from view_chk30;

create or replace view VIEW_READ30
as 
select empno, ename, sal, comm, deptno
from emp_copy2
where deptno = 30 WITH READ ONLY;

-- ORA-42399: �б� ���� �信���� DML �۾��� ������ �� �����ϴ�
update VIEW_READ30 set comm=2000;

-- p.458
select empno, ename, hiredate
from emp
order by hiredate;

-- �並 �̿��ؼ� ����� ���� ������ �� �� ����
-- ���� ���� > ���� 

select ROWNUM, empno, ename, hiredate
from  (select empno, ename, hiredate
       from emp
       order by hiredate)
where ROWNUM <=5;

select B.*
from (select rownum as rnum, A.*
      from (select empno, ename, hiredate
            from emp 
            order by hiredate) A ) B
where rnum between 11 and 20;

-- paging 
-- 0���� 100 ������ ���� ã���� : �����ϰ� �����͸� �Է��ϴ� ��ó�� ������
create table board (
  no number(5), -- �۹�ȣ
  title varchar2(34) not null, -- ������. NULL �� ���ġ ����
  re number(3) default 0, -- ��ȸ��. �⺻�� 0
  regdate date default sysdate); -- ��Ͻð�. �⺻�� ����ð�

-- ������ : like ��ȣǥ 
create sequence seq_board
 start with 1 increment by 1 nocache; -- 1 ���� ���� 1 �� ���� ĳ������.

-- ������ ����ֱ� (PL/SQL ���ν���)
begin
  for i in 1..10002 loop
  insert into board
  values(seq_board.nextval,
  'With A Little Help From My Friends',
  trunc(dbms_random.value(0,100)),
  sysdate-((10002-i)/24/6));
  end loop;
  end;
  /

select no, title, re,
       to_char(regdate,'YYYY-MM-DD hh24:mi:ss') as regdate
from board
where regdate > sysdate - 1/24
order by no desc;

select count(*) from board;

define thisPage=1; 
define pageSize=5;

select rownum, no, title, re,
       to_char(regdate,'YYYY-MM-DD') as regdate
from board
where rownum between (&thisPage-1)*&pageSize+1 and &thisPage*&pageSize
order by no desc;

--old 4: where rownum between (&thisPage-1)*&pageSize+1
--new 4: where rownum between (1-1)*5+1
--old 5: and &thisPage*&pageSize
--new 5: and 1*5

select A.*
from (select no, title, re,
             to_char(regdate,'YYYY-MM-DD') as regdate
      from board
      order by no desc) A
where rownum between (&thisPage-1)*&pageSize+1 and &thisPage*&pageSize;

define thisPage=2;
select B.*
from (select rownum as rnum, A.*
      from (select no, title, re, to_char(regdate,'YYYY-MM-DD') as regdate
            from board
            order by no desc) A) B
where rnum between (&thisPage-1)*&pageSize+1 and &thisPage*&pageSize;

-- ���� �ڷ� 
create table board (
no        number,      
title     varchar2(34) not null,
re        number(3) default 0,
regdate   date  default sysdate);

alter table board add constraint pk_board
primary key(no);

drop sequence seq_board;
create sequence seq_board
start with 1 increment by 1 nocache;

begin
  for i in 1..2000000 loop
    insert into board
    values(seq_board.nextval,
       'With A Little Help From My Friends',
       trunc(dbms_random.value(0,100)),
       sysdate-((1000000-i)/24/6));
    end loop;
  end;
/

set autot on
set timing on
col content noprint

select B.*
from   (select rownum as rnum, A.*
       from   (select no, title, re,
                       case to_char(regdate,'YYYY-MM-DD')
                       when to_char(sysdate,'YYYY-MM-DD')
                       then to_char(regdate,'HH24:MI:SS')
                       else to_char(regdate,'YYYY-MM-DD')
                       end as regdate
               from   board
               order  by no desc) A) B
where   rnum between (&thisPage-1)*&pageSize+1
and     &thisPage*&pageSize;

SELECT no, title, re,
       case to_char(regdate,'YYYY-MM-DD')
       when to_char(sysdate,'YYYY-MM-DD')
       then to_char(regdate,'HH24:MI:SS')
       else to_char(regdate,'YYYY-MM-DD')
       end as regdate
from   board
order  by no desc
OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY;

commit;

-- new
create table myno (
no        number);

begin 
    for i in 1..100 loop
        insert into myno values(i);
    end loop;
end;
/
commit;

select no, deptno, job, sumsal
from (select deptno, job, sum(sal) as sumsal 
      from emp
      group by deptno, job
      order by 1, 2)
      cross join (select no from myno where no <= 3 order by no);
      
select *
from (select deptno, job, sum(sal) as sumsal
      from emp
      group by deptno, job
      order by 1, 2)
      cross join (select no from myno where no <=3 order by no)
group by decode(no, 1, deptno, 2, deptno), 
         decode(no,
         1, job)
order by 1, 2;