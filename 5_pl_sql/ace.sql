set serveroutput on

begin
    for i in 1..10 loop
        dbms_output.put_line('Hello World!');
    end loop;
end;
/

begin
    select salary
    from employees
    where employee_id = 101;
    
    insert into t1
    values(
end;
/

drop table t1 purge;
create table t1 (col1 number, col2 number); 
declare 
    v_employee_id employees.employee_id%type;
    v_salary      employees.salary%type; 
begin
    select employee_id, salary into v_employee_id, v_salary
    from employees
    where employee_id = 141;
    
    if v_salary < 5000 then
        dbms_output.put_line('Are you Kidding me??');
    else 
        insert into t1(col1, col2)
        values(v_employee_id, v_salary);
    end if; 
    
    commit;
end;
/

select * from t1;


-- simple examples : named block으로 수정 
create or replace procedure p1(maxLoop number)
is 
begin 
    for i in 1..maxLoop loop
        dbms_output.put_line('Hello world');
    end loop; 
end; 
/

-- 실행 (매개변수 실행 가능)
execute p1(3); 
execute p1(100); 
begin 
    p1; 
end;
/

select * from user_objects
where object_type = 'PROCEDURE';

select * from user_source;

----------------------
  create or replace procedure p1(
    p_employee_id employees.employee_id%type
  )
  is
    v_employee_id  employees.employee_id%type;
    v_salary       employees.salary%type;
  begin
    select employee_id, salary into v_employee_id, v_salary
    from employees
    where employee_id = p_employee_id;

    if v_salary < 5000 then
      dbms_output.put_line('Are you kidding me?');
    else
      insert into t1(col1, col2)
      values (v_employee_id, v_salary);
    end if;

    commit;
  end;
  /
execute p1;
-- Popup 퀴즈
-- 부서 번호를 입력하면 그 부서의 급여합이 출력되도록 프로시져를 만드세요

CREATE OR REPLACE PROCEDURE get_employees_sum_sal_by_department_id (
    p_department_id IN employees.department_id%TYPE
) AS
    total_salary NUMBER;
BEGIN
    SELECT
        SUM(salary)
    INTO total_salary
    FROM
        employees
    WHERE
        department_id = p_department_id;

    dbms_output.put_line('부서 '
                         || p_department_id
                         || '의 급여 총합: '
                         || total_salary);
END;
/
execute get_employees_sum_sal_by_department_id(10);
execute get_employees_sum_sal_by_department_id(50);


-- subprogram = procedure 및 function
-- procedure 예제
-- funtion 예제

create or replace function tax( 
    p_salary employees.salary%type
) return number
is 
begin   
    return p_salary *0.013;
end;
/

select employee_id, 
       last_name, 
       upper(last_name) as upper_last_name, 
       salary, 
       tax(salary)as tax
from employees;




CREATE OR REPLACE FUNCTION tax(
  p_salary employees.salary%TYPE
) RETURN NUMBER IS
  tax_amount NUMBER;
BEGIN
  IF p_salary < 10000 THEN
    tax_amount := p_salary * 0.013;
  ELSIF p_salary < 20000 THEN
    tax_amount := p_salary * 0.015;
  ELSE
    tax_amount := p_salary * 0.02;
  END IF;

  RETURN tax_amount;
END;
/

CREATE OR REPLACE FUNCTION tax(
  p_salary employees.salary%TYPE
) RETURN NUMBER IS
  tax_rate NUMBER;
BEGIN
  tax_rate := CASE
    WHEN p_salary < 10000 THEN 0.013
    WHEN p_salary < 20000 THEN 0.015
    ELSE 0.02
  END;

  RETURN p_salary * tax_rate;
END;
/
select employee_id, 
       last_name, 
       upper(last_name) as upper_last_name, 
       salary, 
       tax(salary)as tax
from employees;

-- 해답4 





