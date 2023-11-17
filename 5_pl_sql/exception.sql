
-- [1] 값 하나를 리턴하는 SELECT 문
create or replace procedure p1(
    p_employee_id in employees.employee_id%type, 
    p_salary      out employees.salary%type
) 
is 
    v_salary employees.salary%type;
begin 
    select salary into v_salary
    from employees
    where employee_id = p_employee_id;
    
    p_salary := v_salary;
end;
/
show errors;
desc p1;
set serveroutput on;

declare
    v_id  number := 100;
    v_ret number;
begin
    p1(v_id, v_ret);
    dbms_output.put_line(v_id || '의 급여는 ' || v_ret);
end;
/
 
 
 -- [2] 행 하나를 리턴하는 SELECT 
create or replace procedure p1 (
    p_employee_id in  employees.employee_id % type,
    p_last_name   out employees.last_name%type,
    p_salary      out employees.salary%type,
    p_job_id      out employees.job_id%type
)
is 
    employee_row employees%rowtype;
begin 
    select * into employee_row
    from employees
    where employee_id = p_employee_id;
    
    p_last_name := employee_row.last_name;
    p_salary    := employee_row.salary;
    p_job_id    := employee_row.job_id;
end;
/ 

declare
    v_employee_id employees.employee_id%type := 100;
    v_last_name   employees.last_name%type;
    v_salary      employees.salary%type;
    v_job_id      employees.job_id%type;
begin
    p1(v_employee_id, v_last_name, v_salary, v_job_id);
    dbms_output.put_line(v_employee_id);
    dbms_output.put_line(v_last_name);
    dbms_output.put_line(v_salary);
    dbms_output.put_line(v_job_id);
end;
/

--     ↓↓
create or replace procedure p1 (
    p_employee_id  in employees.employee_id%type,
    p_employee_row out employees%rowtype
) is
begin
    select * into p_employee_row
    from employees
    where employee_id = p_employee_id;
end;
/

-- [3] 
create or replace procedure p1(
    p_employee_id  in employees.employee_id%type
)
is
    TYPE nemam IS RECORD (
        last_name  employees.last_name%type, 
        salary     employees.salary%type, 
        job_id     employees.job_id%type
    ); 
    employee_row nemam;
begin
    select last_name, salary, job_id into employee_row
    from employees
    where employee_id = p_employee_id;
    
    dbms_output.put_line(employee_row.last_name);
    dbms_output.put_line(employee_row.salary);
    dbms_output.put_line(employee_row.job_id);
end;
/

-- 실행 
exec p1(100);
exec p1(101);

---------   ↓↓   ----------
create or replace package pack_datatypes 
is 
    Type employee_record_type IS RECORD( 
        last_name  employees.last_name%type, 
        salary     employees.salary%type, 
        job_id     employees.job_id%type); 
end;
/

create or replace procedure p1(
    p_employee_id in employees.employee_id%type
) 
is 
    employee_row pack_datatypes.employee_record_type;
begin 
    select last_name, salary, job_id into employee_row
    from employees
    where employee_id = p_employee_id;
    
    dbms_output.put_line(employee_row.last_name);
    dbms_output.put_line(employee_row.salary);
    dbms_output.put_line(employee_row.job_id);
end;
/
exec p1(100);
exec p1(101);

-- [4]
create or replace procedure p1(
    p_department_id in employees.department_id%type
) 
is 
    TYPE employees_salary_tab_type IS TABLE OF employees.salary%type INDEX BY pls_integer;
    emp_sal_tab employees_salary_tab_type;
begin 
    select salary BULK COLLECT INTO emp_sal_tab
    from employees
    where department_id = p_department_id;
    
    for i in emp_sal_tab.first .. emp_sal_tab.last loop
        dbms_output.put_line(emp_sal_tab(i));
    end loop;
end;
/
exec p1(50);
---------   ↓↓   ----------
create or replace package pack_datatypes 
is 
    TYPE employees_salary_tab_type 
    IS TABLE OF employees.salary%type 
    INDEX BY pls_integer;
    
    emp_sal_tab employees_salary_tab_type;
end;
/

-- [5]
create or replace procedure p1(
    p_department_id in employees.department_id%type
) 
is
    TYPE employees_table_type IS TABLE OF employees%rowtype;
    t employees_table_type;  -- t : 구조체 배열
begin
    select * BULK COLLECT INTO t
    from employees
    where department_id = p_department_id;
   
    for i in t.first .. t.last loop
        dbms_output.put_line(t(1).last_name ||', '||t(1).salary);
    end loop;
end;
/

exec p1(20);
exec p1(50);

-- [6]
create or replace procedure p1(
    p_department_id in employees.department_id%type
) 
is
begin
    select last_name, salary, job_id into ____
    from employees
    where department_id = ?;
end;
/

-----------------
-- 매개변수



-- 프로시저



-- 트리거 
/* 문장 트리거 */
CREATE OR REPLACE TRIGGER secure_emp BEFORE
    INSERT OR UPDATE OR DELETE ON employees
BEGIN
    IF ( to_char(sysdate, 'DY') IN ( 'SAT', 'SUN' ) ) OR 
       ( to_char(sysdate, 'HH24:MI') NOT BETWEEN '09:00' AND '18:00' ) THEN
        raise_application_error(-20500, 'You may insert into EMP table only during business hours.');
    END IF;
END;
/

UPDATE employees
SET salary = salary + 100
WHERE ROWNUM = 1;

rollback;
DROP TRIGGER secure_emp;


/* 행 트리거 */
CREATE OR REPLACE TRIGGER restrict_salary BEFORE
    INSERT OR UPDATE OF salary ON employees
    FOR EACH ROW
BEGIN
    IF NOT ( :new.job IN ( 'AD_PFES', 'AD_VPR' ) ) AND :new.sal > 15000 THEN
        raise_application_error(-20202, 'Employee cannot earn more than $15,000.');
    END IF;
END;
/

UPDATE emp
SET salary = salary + 4500
WHERE deptno = 10;

set long 1000

-- 만들어진 트리거 볼 수 있음 
SELECT trigger_name, trigger_body
FROM user_triggers;

-- # DDL Triggers

  CREATE OR REPLACE TRIGGER grant_connect 
  AFTER CREATE ON DATABASE
  WHEN (dictionary_obj_type = 'USER')
  begin
    execute immediate 'grant connect,resource to '||dictionary_obj_name;
  end;
  / 
  
  
  

---- 예외 처리 
-- [4] 


-- [5] raise_application_error procedure 
--  오라클이 제공하는 프로시저 
-- 사용자 정의 에러가 

create or replace procedure p1(a number)

