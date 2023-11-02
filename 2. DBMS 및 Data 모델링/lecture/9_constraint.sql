insert into dept 
values(10, 'test', 'test'); -- 이미 존재하는 데이터이기 때문에 무결성 위배 

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
-- 사원번호와 사원명을 null 값으로 저장하기 
insert into emp02 values(null, null, '사원', sysdate , 20); -- 사용 불가능 >> 제약 조건 잘 거는 것이 중요함 
select * from emp02;

create table emp02(
    empno number(4) NOT NULL,
    ename varchar2(10) NOT NULL,
    job varchar2(9),
    deptno number(2)
);
-- emp02에 not null 제약조건 살피기
desc emp02;
insert into emp02
values (1000, '허준', '사원', 30);
select *from emp02;

-- p.312
-- unique 제약조건
create table emp03(
    empno number(4) unique,
    ename varchar2(10) NOT NULL,
    job varchar2(9),
    deptno number(2)
);
insert into emp03 values (1000, '허준', '사원', 30);
insert into emp03 values (1000, '홍길동', '과장', 30); -- ORA-00001: 무결성 제약 조건(TESTER1.SYS_C008263)에 위배
insert into emp03 values (null, '안중근', '과장', 30); 
insert into emp03 values (null, '이순신', '과장', 30);
select * from emp03;
-- unique = primary key - not null; 

select * from user_indexes;

-- 제약조건 이름을 명시해서 테이블 생성하기 
create table emp04(
    empno number(4) CONSTRAINT EMP04_EMPNO_UK UNIQUE,
    ename varchar2(10) CONSTRAINT EMP04_ENAME_NN NOT NULL,
    job varchar2(9),
    deptno number(9)
);
-- 제약조건 살피기
select constraint_name, constraint_type, table_name
from user_constraints
where table_name in('EMP04');

-- 동일한 사원 번호로 사원 정보 추가하기 
insert into emp04 values (1000, '허준', '사원', 30);
insert into emp04 values (1000, '홍길동', '과장', 20); -- 무결성 제약 조건(TESTER1.EMP04_EMPNO_UK)에 위배

-- 6. 데이터 구분을 위한 PRIMARY KEY 제약조건
create table emp05(
    empno number(4) CONSTRAINT EMP05_EMPNO_UK PRIMARY KEY,
    ename varchar2(10) CONSTRAINT EMP05_ENAME_NN NOT NULL,
    job varchar2(9),
    deptno number(9)
);
-- 동일한 사원 번호로 사원 정보 추가하기 
insert into emp05 values (1000, '허준', '사원', 30);
insert into emp05 values (1000, '홍길동', '과장', 20); -- 무결성 제약 조건(TESTER1.EMP05_EMPNO_UK)에 위배
insert into emp05 values (NULL, '이순신', '부장', 10); -- NULL을 ("TESTER1"."EMP05"."EMPNO") 안에 삽입할 수 없습니다

-- 제약조건 살피기
desc user_constraints;
select constraint_name, constraint_type, table_name
from user_constraints
where table_name in('DEPT');

-- 제약조건이 지정된 컬럼 살피기
select constraint_name, table_name, column_name
from user_cons_columns
where table_name in('DEPT');

-- p.325
-- 새로운 사원을 존재하지 않는 50번 부서에 소속시키기
insert into emp05 values (1010, '홍길동', '사원', 50);

-- p.326
-- 외래키 제약조건을 주어 테이블 생성하기 
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
    loc varchar2(13) default '서울'
);

insert into dept01 values (10, '경리부');

-- 10. 테이블 레벨 방식으로 제약조건 지정하기
create table emp07(
    empno number(4),
    ename varchar2(10) NOT NULL,
    job varchar2(9),
    deptno number(2),
    
    primary key(empno),
    unique(job),
    foreign key (deptno) references dept (deptno)
);
-- 기본 키를 복합키로 지정하는 방법
create table member01(
    name varchar2(10),
    address varchar2(30),
    hphone varchar2(16),
    
    constraint MEMBER01_COMBO_PK primary key (name, hphone)
);

-- 11. 제약조건 변경하기 
alter table emp01
add constraint EMP01_EMPNO_PK primary key(empno);

alter table emp01
modify ename constraint EMP01_EMPNO_NN not null;

alter table emp01
drop constraint EMP01_EMPNO_NN;

-- 12. 제약조건의 비활성화와 CASCADE

alter table emp01
disable constraint emp01_deptno_fk;

-- cascade 옵션을 지정하여 기본 키 제약조건을 비활성화 
alter table dept01
disable primary key casade;

-- 기본 키 케약조건을 제거 
alter table dept01
drop primary key; -- 사원 테이블의 외래 키에서 참조하고 있기 때문에 제거 X 

alter table dept01
drop primary key casade; 
