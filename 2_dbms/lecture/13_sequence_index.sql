

drop table dept01;
create table dept01
as
select * from dept where 1=0;

-- �μ� ���̺� ������ �߰��ϱ�
insert into dept01 values (10, '�λ��', '����');
insert into dept01 values (20, '�ѹ���', '����');
insert into dept01 values (30, '������', '����');

-- �μ� ���̺� ������ ��ȸ�ϱ�
select * from dept01;

-- ���� �ε��� �����ϱ� 
create UNIQUE index IDX_DEPT01_DEPTNO
on dept01(deptno);

-- �̹� �����ϴ� ���� �ε����� ������ ��� ������ �߻��ϴ� ��
create UNIQUE index IDX_DEPT01_LOC
on dept01(loc); -- ORA-01452: �ߺ� Ű�� �ֽ��ϴ�. ������ �ε����� �ۼ��� �� �����ϴ�

-- ���� �ε��� �����ϱ�
create index IDX_DEPT01_LOC
on dept01(loc);


-- 5-2. ���� �ε��� 
-- p.498
create index idx_dept01_com
on dept01(deptno, dname);

select index_name, column_name
from user_ind_columns
where table_name in ('DEPT01');

-- 5-3. �Լ� ��� �ε��� �����ϱ� 
create index idx_emp01_annsal
on emp01(sal * 12);




