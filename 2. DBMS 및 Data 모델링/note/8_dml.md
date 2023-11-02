# 8장. DML (data insert, update, delte)과 트랜잭션 (Transaction)

## 1. 테이블에 내용을 추가하는 INSERT 문

```sql
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
```

```sql
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

insert into emp02
values(1002, '한예슬', '대리', to_date('2014, 05, 01', 'YYYY, MM, DD'), 20);

-- SYSDATE 함수로 현재 날짜 입력하기 
insert into emp02
values(7020, 'JERRY', 'SALESMAN', SYSDATE, 30);

select * from emp02;
```

## 2. 테이블에 내용을 수정하는 UPDATE 문

```sql
update dept01
set dname='생산부2', loc='부산'
where deptno=10;
```

## 3. 테이블의 내용을 삭제하는 DELETE 문

```sql
-- 특정 로우만 삭제하기 
delete dept01
where deptno=10;

-- where 절 생략하여 모든 로우 삭제하기 
delete dept01; 
```

## 4. 트랜잭션 관리

- 오라클은 트랜잭션을 기반으로 데이터의 일관성을 보장함
    - 트랜잭션 (Transaction)
        - 데이터 처리에서 **하나의 작업 단위**
        - DML 명령어(insert, update, delete)가 실행됨과 동시에 트랜잭션 실행
- 명령어
    - COMMIT
        - 모든 작업들을 확정하는 명령어
        - 변경된 내용을 모두 영구 작업
        - COMMIT 명령어를 수행 하게 되면, 하나의 트랜잭션 과정을 종료함
    - ROLLBACK
        - 변경사항을 취소하는 명령어
        - ROLLBACK 명령어를 수행 하게 되면, 하나의 트랜잭션 과정을 종료함
        - 트랜잭션으로 인한 하나의 묶음 처리가 시작되기 이전의 상태로 되돌림