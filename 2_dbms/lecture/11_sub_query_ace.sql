-- ��ü ����� ��� �޿����� ���� �޿��� �ް� �ִ� ������� �̸��� ���
select last_name, salary
from employees
where salary < (select avg(salary) 
                from employees);

-- Mourgos�� ���� ���� ��� �̸� ��� ���
select last_name
from employees
where manager_id = (select employee_id 
                    from employees 
                    where last_name = 'Mourgos');

-- ������ IT_PROG�� ������� ��� �޿����� ���� �޿��� �޴� ������� ���
select last_name
from employees
where salary < (select avg(salary) 
                from employees 
                where job_id = 'IT_PROG'); 