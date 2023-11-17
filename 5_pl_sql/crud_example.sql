--# ChatGPT�� Ȱ���� PL/SQL ��Ű�� �����
  
-- (1) ���̺� ����

  drop table products purge;

  create table products
  (id    number generated as identity primary key,
   prod_name  varchar2(30),
   prod_price number(10, 2));
   
-- (2) �� ���̺� CRUD�ϴ� stand-alone subprogram(stored procedure �� stored function) ������� 

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
-- create ���� 
select * from products;

begin
    insert_product('��Ʈ�� �Ŀ�ġ', 10000);
    insert_product('��Ʈ��', 15000);
    commit;
end;
/ 
select * from products;

-- read ���� 
DECLARE
    prod_cursor SYS_REFCURSOR;
    prod_id NUMBER := 1;
    prod_name VARCHAR2(30);
    prod_price NUMBER(10, 2);
BEGIN
    prod_cursor := read_product_by_id(prod_id);
    
    LOOP
        FETCH prod_cursor INTO prod_id, prod_name, prod_price; -- Ŀ������ ��� �÷��� �о�ɴϴ�.
        EXIT WHEN prod_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || prod_id || ', Name: ' || prod_name || ', Price: ' || prod_price);
    END LOOP;
    
    CLOSE prod_cursor;
END;
/
select * from products;

--������Ʈ ����
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

-- (3) �� ���̺� CRUD�ϴ� ��Ű�� �������

-- ��Ű�� ����
CREATE OR REPLACE PACKAGE product_pkg AS
    -- ��ǰ ���� ���ν���
    PROCEDURE create_product(
        prod_name IN VARCHAR2,
        prod_price IN NUMBER
    );

    -- ��ǰ ��ȸ �Լ�
    FUNCTION get_product(
        prod_id IN NUMBER
    ) RETURN SYS_REFCURSOR;

    -- ��ǰ ���� ������Ʈ ���ν���
    PROCEDURE update_product_price(
        prod_id IN NUMBER,
        new_price IN NUMBER
    );

    -- ��ǰ ���� ���ν���
    PROCEDURE delete_product(
        prod_id IN NUMBER
    );
END product_pkg;
/

-- ��Ű�� ��ü ����
CREATE OR REPLACE PACKAGE BODY product_pkg AS
    -- ��ǰ ���� ���ν��� ����
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

    -- ��ǰ ��ȸ �Լ� ����
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

    -- ��ǰ ���� ������Ʈ ���ν��� ����
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

    -- ��ǰ ���� ���ν��� ����
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
truncate table products; -- ������ �����

-- create ���� 
exec product_pkg.create_product('��Ʈ�� �Ŀ�ġ', 10000);
exec product_pkg.create_product('��Ʈ��', 15000);
select * from products;


drop procedure create_product;
drop procedure get_product;
drop function update_product_price;
drop procedure delete_product ;

select * from user_objects
where object_type in ('PROCEDURE', 'FUNCTION', 'PACKAGE', 'PACKAGE BODY');
  
select * from user_source
where name = 'PRODUCT_PKG';

