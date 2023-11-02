# 9장. 데이터 무결성을 위한 제약조건 (Constraints)

## 1. 무결성 제약조건의 개념과 종류

- 데이터가 무결해야 한다 = 정확성을 유지해야 한다
- 제약조건 = 바람직하지 않은 데이터가 저장되는 것을 방지하는
- primary key = not null + unique

| 무결성 제약조건 | 역할 |
| --- | --- |
| NOT NULL | null 허용 x  |
| UNIQUE | 중복된 값 허용 x, 항상 유일한 값 가져야 함 |
| PRIMARY KEY | null 허용 x, 중복 x , not null + unique |
| FOREIGN KEY | 참조되는 테이블에서 컬럼 값 존재하면 o  |
| CHECK | 저장 가능한 데이터 값의 범위나 조건을 지정하여 설정한 값 만을 허용함  |

## 2. 제약조건 확인하기

- USER_CONSTRAINTS 데이터 딕셔너리는 20개 정도의 컬럼을 통해서 제약조건에 관련된 정보를 제공함
    
    
    | 컬럼명 | 설명 |
    | --- | --- |
    | OWNER | 제약 조건을 소유한 사용자 명 |
    | CONSTRAINT_NAME | 제약 조건 명 |
    | CONSTRAINT_TYPE | 제약 조건 유형 |
    | TABLE_NAME | 제약 조건이 속한 테이블 명 |
    | SEARCH_CONDITION | CHECK 조건일 경우에는 어떤 내용이 조건으로 사용되었는지 설 |
    | R_CONSTRAINT_NAME | foreign key인 경우 어떤 primary key 를 참조했는지에 대한 정보를 가짐 |
- constraint_type
    
    
    | constraint_type | 의미 |
    | --- | --- |
    | P | PRIMARY KEY |
    | R | FOREIGN KEY |
    | U | UNIQUE |
    | C | CHECK, NOT NULL |

## 3. 필수 입력을 위한 NOT NULL 제약조건

### 3-1. 컬럼 레벨 정의 방법으로 제약조건 지정하기

- 형식
    
    ```sql
    column_name data_type constraint_type 
    ```
    
- NOT NULL 제약조건을 설정하여 테이블 생성하기
    
    ```sql
    create table emp02(
        empno number(4) NOT NULL,
        ename varchar2(10) NOT NULL,
        job varchar2(9),
        deptno number(2)
    );
    
    desc emp02; -- emp02에 not null 제약조건 살피기
    
    insert into emp02
    values (1000, '허준', '사원', 30);
    ```
    

## 4. 유일한 값만 허용하는 UNIQUE 제약 조건

- unique
    - 특정 칼럼에 대해 **자료가 중복되지 않게 하는**
        - 값이 유일함
    - **null 값은 중복되어 저장할 수 있음**
    - index 가 자동 생성됨
        - index : 빠르게 값을 찾기 위해서 사용하는

```sql
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
```

## 5. 컬럼 레벨로 제약 조건 이름을 명시해서 제약 조건 설정하기

- 제약 조건을 위반하면 오류 메시지에 제약 조건 이름만 출력되는데, 오라클이 부여한 제약조건 이름으로는 어떤 제약 조건을 위반했는지 알 수 없기에, user_constraints 데이터 딕셔너리를 검색해야만 어떤 제약조건인지 확인할 수 있음
    - 사용자가 의미있게 제약조건 이름을 명시한다면, **제약조건 이름만으로도 어떤 제약조건을 위반했는지 알 수 있게** 됨
    - 제약 조건 이름을 지정하는 방법
        
        ```sql
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
        insert into emp04 values (1000, '홍길동', '과장', 20); -- 에러 발생
        
        ```
        

## 6. 데이터 구분을 위한 PRIMARY KEY 제약조건

- null 값을 허용하지 않음
    
    ```sql
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
    ```
    

## 7. 참조 무결성을 위한 FOREIGN KEY

- 참조 무결성
    - 테이블 사이의 관계에서 발생하는 개념
        
        ```sql
        -- 제약조건 살피기
        desc user_constraints;
        select constraint_name, constraint_type, table_name
        from user_constraints
        where table_name in('DEPT');
        
        -- 제약조건이 지정된 컬럼 살피기
        select constraint_name, table_name, column_name
        from user_cons_columns
        where table_name in('DEPT');
        ```
        

```sql
-- p.326
-- 외래키 제약조건을 주어 테이블 생성하기 
create table emp06(
    empno number(4) CONSTRAINT EMP06_EMPNO_UK PRIMARY KEY,
    ename varchar2(10) CONSTRAINT EMP06_ENAME_NN NOT NULL,
    job varchar2(9),
    deptno number(9) CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT(DEPTNO)
);
```

## 8. CHECK 제약조건

- 입력되는 값을 체크하여, **설정된 값 이외의 값이 들어오면 오류 메시지와 함께 명령이 수행X**
    - 조건으로 데이터 값의 범위나 특정 패턴의 숫자나 문자 값을 설정할 수 있음

```sql
create table emp07(
    empno number(4) CONSTRAINT EMP07_EMPNO_UK PRIMARY KEY,
    ename varchar2(10) CONSTRAINT EMP07_ENAME_NN NOT NULL,
    sal number(7,2) CONSTRAINT EMP07_SAL_CK **CHECK**(SAL BETWEEN 500 AND 5000),
    gender varchar2(1) CONSTRAINT EMP07_GENDER_CK **CHECK**(GENDER IN('M','F'))
);
```

## 9. DEFAULT 제약조건

- 아무런 값을 입력하지 않았을 때, **디폴트 값으로 입력되도록 지정하고 싶을 때 사용**함

```sql
create table emp07(
    depno number(2) primary key,
    dname varchar2(14),
    loc varchar2(13) default '서울'
);

insert into dept01 values (10, '경리부');
```

## 10. 테이블 레벨 방식으로 제약조건 지정하기

```sql
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
```

## 11. 제약조건 변경하기

### 11-1. 제약조건 추가하기

```sql
alter table emp01
**add constraint** EMP01_EMPNO_PK primary key(empno);
```

### 11-2. MODIFY로 NOT NULL 제약조건 추가하기 (변경)

```sql
alter table emp01
**modify ename constraint** EMP01_EMPNO_NN not null;
```

### 11-3. 제약조건 제거하기

```sql
alter table emp01
**drop constraint** EMP01_EMPNO_NN;
```

## 12. 제약조건의 비활성화와 CASCADE

- 제약조건이 설정되면 항상 그 규칙에 따라 데이터 무결성이 보장됨
    - 오라클에서는 제약조건을 삭제하지 않고도 제약조건 사용을 잠시 보류할 수 있는 방법으로 제약 조건의 바활성화를 제공함

### 12-1. 제약조건의 비활성화

- disable constraint : 제약조건의 일시 비활성화
    
    ```sql
    alter table emp01
    **disable constraint** emp01_deptno_fk;
    ```
    

### 12-2. 제약조건의 활성화

- enable constraint : 비활성화된 제약조건을 해제하여 다시 활성화 함
    
    ```sql
    alter table emp01
    **enable constraint** emp01_deptno_fk;
    ```
    

### 12-3. CASCADE 옵션

- 부모 테이블과 자식 테이블 간의 참조 설정이 되어 있을 때, **부모 테이블의 제약조건을 비활성화 하면서, 이를 참조하고 있는 자식 테이블의 제약조건까지 함께 비활성화하기 위해 사용**하는 옵션
    - 제약조건 삭제에도 활용됨
    
    ```sql
    alter table emp01
    **disable constraint** emp01_deptno_fk;
    
    -- 기본 키 케약조건을 제거 
    alter table dept01
    drop primary key; -- 사원 테이블의 외래 키에서 참조하고 있기 때문에 제거 X 
    
    alter table dept01
    drop primary key casade;
    ```