-- cross join
--��� ����� ���ϴ� �μ� ã�� 
select e.last_name ,d.department_id ,d.department_name
from employees e, departments d
where e.department_id = d.department_id;


select last_name, department_name
from employees join departments
using(department_id); -- ���� ���� ���

-- non equi join
select e.last_name   as �����
      ,e.salary      as �޿�
      ,j.grade_level as ���
from employees e ,job_grades j
where e.salary between j.lowest_sal and j.highest_sal;

select e.last_name   as �����
      ,e.salary      as �޿�
      ,j.grade_level as ���
from employees e join job_grades j
on e.salary between j.lowest_sal and j.highest_sal;

-- OUTER JOIN
-- (1) LEFT OUTER JOIN
select e.last_name ,d.department_id ,d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

select e.last_name ,d.department_id ,d.department_name
from employees e left join departments d
on e.department_id = d.department_id;

-- (2) RIGHT OUTER JOIN
select e.last_name, d.department_name
from employees e ,departments d
where e.employee_id(+) = d.manager_id; 

select e.last_name, d.department_name
from employees e right join departments d
on e.employee_id = d.manager_id; 

-- SELF JOIN
-- �����     | ���� ���
-- last_name | last_name
select e.last_name as ���
      ,m.last_name as ����
from employees e, employees m
where e.employee_id = m.manager_id(+);

select e.last_name as ���
      ,m.last_name as ����
from employees e left join employees m
on e.employee_id = m.manager_id;

-- natural join 
select last_name, department_name
from employees join departments
using(department_id); -- ���� ���� ���

select e.last_name       as �����
      ,d.department_name as �μ���
      ,j.grade_level     as ���
from employees e ,departments d ,job_grades j
where e.department_id = d.department_id(+)
and   e.salary between j.lowest_sal and j.highest_sal;

select e.last_name       as �����
      ,d.department_name as �μ���
      ,e.salary          as �޿�
      ,j.grade_level     as ���
from employees e 
left join departments d 
on e.department_id = d.department_id
inner join job_grades j
on e.salary between j.lowest_sal and j.highest_sal;

select e.last_name       as �����
      ,d.department_name as �μ���
      ,m.last_name       as �����
      ,lo.city           as ���ø�
      ,j.job_title       as ����
from employees e ,departments d ,employees m ,locations lo 
    ,jobs j 
where e.department_id = d.department_id(+)
and   e.manager_id = m.employee_id(+)
and   d.location_id = lo.location_id(+)
and   e.job_id = j.job_id;

select e.last_name       as �����
      ,d.department_name as �μ���
      ,m.last_name       as �����
      ,lo.city           as ���ø�
      ,j.job_title       as ����
from employees e 
left join departments d
on e.department_id = d.department_id
left join employees m 
on e.manager_id = m.employee_id
left join locations lo
on d.location_id = lo.location_id
join jobs j
on e.job_id = j.job_id;

---------------------------------------------
select e.LAST_NAME       as �����
      ,e.SALARY          as �޿�
      ,j.GRADE_LEVEL     as ���
      ,d.DEPARTMENT_NAME as �μ��� 
      ,lo.city           as ���ø�
      ,c.country_name    as �����
from employees e 
inner join job_grades j
on e.salary between j.lowest_sal and j.highest_sal
left join departments d
on e.department_id = d.department_id
left join locations lo
on d.location_id = lo.location_id
left join countries c
on lo.country_id = c.country_id;

select e.LAST_NAME       as �����
      ,e.SALARY          as �޿�
      ,j.GRADE_LEVEL     as ���
      ,d.DEPARTMENT_NAME as �μ��� 
      ,lo.city           as ���ø�
      ,c.country_name    as �����
from employees e, job_grades j, 
    departments d ,locations lo ,countries c
where e.salary between j.lowest_sal and j.highest_sal
and   e.department_id = d.department_id(+)
and   d.location_id = lo.location_id(+)
and   lo.country_id = c.country_id(+);


