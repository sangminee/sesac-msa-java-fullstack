-- 8장
-- conn tester1 
-- p.282
-- 부서 정보를 저장하기 위한 테이블 생성하기
create table dept01(
    deptno number(2),
    dname varchar2(14),
    loc   varchar2(13)
);

desc dept01;

-- 경리부를 입력하기 
insert into dept01
values (10, '경리부', '서울'); -- 이런식으로 쿼리 작성되면 안됨 (칼럼명 기입이 반드시 필요함)

-- 암시적으로 NULL 값 삽입하기 
insert into dept01(deptno, dname) values (20, '테스트');
select * from dept01;

insert into dept01 values (50, '전산부');  -- 에러 (컬럼 수 맞춰야 함)

--- 공백문자 삽입하기 (쿼리상으로는 null로 들어감 - 제대로 확인해주는 것이 필요함)
insert into dept01 values (50, '기획부','');
select * from dept01; 

-- 284
-- 사원 정보를 저장하기 위한 테이블 생성
create table emp02(
    empno number(4),
    ename varchar2(10),
    job   varchar2(9),
    hiredate date,
    deptno number(2)
);
desc emp02;

insert into emp02
values (1001, '김사랑', '사원', '2015/03/01', 20);
select * from emp02;

insert into emp02
values(1002, '한예슬', '대리', to_date('2014, 05, 01', 'YYYY, MM, DD'), 20);

select * from emp02;

-- SYSDATE 함수로 현재 날짜 입력하기 
insert into emp02
values(7020, 'JERRY', 'SALESMAN', SYSDATE, 30);

select * from emp02;

-- 02. 테이블의 내용을 수정하는 UPDATE 문
update dept01
set dname='생산부2', loc='부산'
where deptno=10;

select * from dept01;

commit;
rollback; 

update dept01
set dname='생산부2', loc='부산'; -- 조건절이 없으면 모두 다 적용됨

-- 03. 테이블의 내용을 삭제하는 delete 문
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



