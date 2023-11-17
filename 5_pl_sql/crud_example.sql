--# ChatGPT를 활용해 PL/SQL 패키지 만들기
  
-- (1) 테이블 생성

  drop table products purge;

  create table products
  (id    number generated as identity primary key,
   prod_name  varchar2(30),
   prod_price number(10, 2));
   
-- (2) 위 테이블에 CRUD하는 stand-alone subprogram(stored procedure 및 stored function) 만들어줘 

create or replace procedure insert_product(
    prod_name in varchar2,
    prod_price in number
)
is
begin
    insert into products (prod_name, prod_price)
    values (prod_name, prod_price);
    commit;
end;
/

create or replace function read_product_by_id(
    prod_id in number
) return sys_refcursor
is
    prod_cursor sys_refcursor;
begin
    open prod_cursor for
    select * from products where id = prod_id;
    return prod_cursor;
end read_product_by_id;
/

create or replace procedure update_product_price(
    prod_id in number,
    new_price in number
)
is
begin
    update products
    set prod_price = new_price
    where id = prod_id;
    commit;
end;
/

create or replace procedure delete_product(
    prod_id in number
)
is
begin
    delete from products where id = prod_id;
    commit;
end;
/
-- create 예시 
select * from products;

begin
    insert_product('노트북 파우치', 10000);
    insert_product('노트북', 15000);
    commit;
end;
/ 
select * from products;

-- read 예시 
DECLARE
    prod_cursor SYS_REFCURSOR;
    prod_id NUMBER := 1;
    prod_name VARCHAR2(30);
    prod_price NUMBER(10, 2);
BEGIN
    prod_cursor := read_product_by_id(prod_id);
    
    LOOP
        FETCH prod_cursor INTO prod_id, prod_name, prod_price; -- 커서에서 모든 컬럼을 읽어옵니다.
        EXIT WHEN prod_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || prod_id || ', Name: ' || prod_name || ', Price: ' || prod_price);
    END LOOP;
    
    CLOSE prod_cursor;
END;
/
select * from products;

--업데이트 예시
begin
    update_product_price(1, 12);
    commit;
end;
/
select * from products;

-- delete
 begin
    delete_product(1);
    commit;
  end;
/

  select * from products;

-- (3) 위 테이블에 CRUD하는 패키지 만들어줘

-- 패키지 생성
CREATE OR REPLACE PACKAGE product_pkg AS
    -- 제품 생성 프로시저
    PROCEDURE create_product(
        prod_name IN VARCHAR2,
        prod_price IN NUMBER
    );

    -- 제품 조회 함수
    FUNCTION get_product(
        prod_id IN NUMBER
    ) RETURN SYS_REFCURSOR;

    -- 제품 가격 업데이트 프로시저
    PROCEDURE update_product_price(
        prod_id IN NUMBER,
        new_price IN NUMBER
    );

    -- 제품 삭제 프로시저
    PROCEDURE delete_product(
        prod_id IN NUMBER
    );
END product_pkg;
/

-- 패키지 본체 구현
CREATE OR REPLACE PACKAGE BODY product_pkg AS
    -- 제품 생성 프로시저 구현
    PROCEDURE create_product(
        prod_name IN VARCHAR2,
        prod_price IN NUMBER
    )
    IS
    BEGIN
        INSERT INTO products (prod_name, prod_price)
        VALUES (prod_name, prod_price);
        COMMIT;
    END;

    -- 제품 조회 함수 구현
    FUNCTION get_product(
        prod_id IN NUMBER
    ) RETURN SYS_REFCURSOR
    IS
        prod_cursor SYS_REFCURSOR;
    BEGIN
        OPEN prod_cursor FOR
        SELECT * FROM products WHERE id = prod_id;
        RETURN prod_cursor;
    END;

    -- 제품 가격 업데이트 프로시저 구현
    PROCEDURE update_product_price(
        prod_id IN NUMBER,
        new_price IN NUMBER
    )
    IS
    BEGIN
        UPDATE products
        SET prod_price = new_price
        WHERE id = prod_id;
        COMMIT;
    END;

    -- 제품 삭제 프로시저 구현
    PROCEDURE delete_product(
        prod_id IN NUMBER
    )
    IS
    BEGIN
        DELETE FROM products WHERE id = prod_id;
        COMMIT;
    END;
END product_pkg;
/

desc product_pkg;
truncate table products; -- 데이터 지우기

-- create 예시 
exec product_pkg.create_product('노트북 파우치', 10000);
exec product_pkg.create_product('노트북', 15000);
select * from products;


drop procedure create_product;
drop procedure get_product;
drop function update_product_price;
drop procedure delete_product ;

select * from user_objects
where object_type in ('PROCEDURE', 'FUNCTION', 'PACKAGE', 'PACKAGE BODY');
  
select * from user_source
where name = 'PRODUCT_PKG';

