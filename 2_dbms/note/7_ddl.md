# 7장. 테이블 구조를 생성,변경 및 제거하는 DDL

## 1. 테이블 구조를 만드는 CREATE TABLE 문

```sql
-- 부서 정보를 저장하기 위한 테이블 생성하기
create table dept01(
    deptno number(2),
    dname varchar2(14),
    loc   varchar2(13)
);

desc dept01; -- 테이블 생성되었는지 확인
```

## 2. 테이블 구조를 변경하는 ALTER TABLE 문

### 2-1. 컬럼 추가

```sql
-- 사원테이블에 날짜 타입을 가지는 birth 컬럼 추가하기
alter table emp01
add(birth date);
```

### 2-2. 컬럼 변경

```sql
-- 사원 이름 컬럼 크기 변경하기
alter table emp01
modify ename varchar2(30);
```

### 2-3. 컬럼 제거

```sql
-- 사원 테이블에서 이름 컬럼 제거하기 
alter table emp01
drop column ename;
```

### 2-4. SET UNUSED (p.265)

- 시스템의 요구가 적을 때 컬럼을 제거할 수 있도록 하나 이상의 컬럼을 unused로 표시함

```sql
-- 사원 테이블에서 사원번호 제거하기
alter table emp01
drop unused columns;
```

## 3. 테이블 명을 변경하는 RENAME문

```sql
-- 테이블 명 변경
rename emp02 to emp01;
rename emp01 to emp02;
```

## 4. 테이블 구조를 제거하는 DROP TABLE 문과 모든 데이터를 제거하는 TRUNCATE TABLE 문

```sql
-- 테이블 제거 
drop table emp02;
```

## 5. 데이터 딕셔너리

- 데이터 딕셔너리
    - 사용자와 데이터베이스 자원을 효율적으로 관리하기 위해 다양한 정보를 저장하는 **시스템 테이블의 집합**
    - 사용자가 테이블 생성하거나, 사용자를 변경하는 등의 작업을 할 때, 데이터베이스 서버에 의해 **자동으로 갱신되는 테이블**
        - 사용자는 **데이터 딕셔너리의 내용을 직접 수정하거나 삭제할 수 없고**, 사용자가 이해할 수 있는 데이터를 산출해 줄 수 있도록 하기 위해서, **읽기 전용 뷰 형태로 정보를 제공**함
    - 종류
        
        
        | 접두어 | 의미 |
        | --- | --- |
        | USER_ | 자신의 계정이 소유한 객체 등에 관한 정보 조희 |
        | ALL_ | 자신 계정 소유 또는 권한을 부여 받은 객체 등에 관한 정보 조회 |
        | DBA_ | 데이터베이스 관리자만 접근 가능한 객체 등의 정보 조회  |

### 5-1. USER_ 데이터 딕셔너리

- **사용자와 가장 밀접하게 관련된 뷰**
    - 자신이 생성한 테이블, 인덱스, 뷰, 동의어 등의 객체나 해당 사용자에게 부여된 권한 정보를 제공함
- 다루는 객체
    - 시퀀스, 인덱스, 뷰 등이 존재
        - USER_SEQUENCES : 사용자가 소유한 시퀀스의 정보를 조회할 수 있는 데이터 딕셔너리
        - USER_INDEXES : 사용자가 소유한 인덱스 정보를 조회할 수 있는 데이터 딕셔너리
        - USER_VIEWS : 사용자가 소유한 뷰 정보를 조회할 수 있는 데이터 딕셔너리

### 5-2. ALL_ 데이터 딕셔너리

- 전체 사용자와 관련된 뷰로서, 사용자가 접근할 수 있는 모든 객체에 대한 정보를 조회할 수 있음

```sql
-- conn ace
show user;
select owner, table_name from all_tables; -- 모든 테이블을 볼 수 있는
```

### 5-3. DBA_ 데이터 딕셔너리

- 시스템 관리와 관련된 뷰
    - DBA나 시스템 권한을 가진 사용자만 접근 가능
    
    ```sql
    -- conn system
    select owner, table_name from dba_tables; -- 시스템 운영하는데 필요한 시스템 뷰
    
    -- 기존에 사용하던 테이블의 모든 로우를 제거하기 위해 'TRUNCATE'가 제공됨
    -- TRUNCATE table_name;
    -- 테이블 복제
    -- conn tester1
    create table emp11
    as 
    select * from emp;
    
    truncate table emp11;
    select * from emp11;
    
    select * from tab; -- 테이블이 여전히 존재하는 것 확인 가능
    ```