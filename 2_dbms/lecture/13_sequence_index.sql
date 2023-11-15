

drop table dept01;
create table dept01
as
select * from dept where 1=0;

-- 부서 테이블에 데이터 추가하기
insert into dept01 values (10, '인사과', '서울');
insert into dept01 values (20, '총무과', '대전');
insert into dept01 values (30, '교육팀', '대전');

-- 부서 테이블에 데이터 조회하기
select * from dept01;

-- 고유 인덱스 지정하기 
create UNIQUE index IDX_DEPT01_DEPTNO
on dept01(deptno);

-- 이미 존재하는 고유 인덱스를 생성할 경우 오류가 발생하는 예
create UNIQUE index IDX_DEPT01_LOC
on dept01(loc); -- ORA-01452: 중복 키가 있습니다. 유일한 인덱스를 작성할 수 없습니다

-- 비교유 인덱스 생성하기
create index IDX_DEPT01_LOC
on dept01(loc);


-- 5-2. 결합 인덱스 
-- p.498
create index idx_dept01_com
on dept01(deptno, dname);

select index_name, column_name
from user_ind_columns
where table_name in ('DEPT01');

-- 5-3. 함수 기반 인덱스 정의하기 
create index idx_emp01_annsal
on emp01(sal * 12);




