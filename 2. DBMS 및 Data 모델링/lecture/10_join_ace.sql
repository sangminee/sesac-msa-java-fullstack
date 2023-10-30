-- cross join
--모든 사원이 일하는 부서 찾기 
select e.last_name ,d.department_id ,d.department_name
from employees e, departments d
where e.department_id = d.department_id;


select last_name, department_name
from employees join departments
using(department_id); -- 조인 조건 명시

-- non equi join
select e.last_name   as 사원명
      ,e.salary      as 급여
      ,j.grade_level as 등급
from employees e ,job_grades j
where e.salary between j.lowest_sal and j.highest_sal;

select e.last_name   as 사원명
      ,e.salary      as 급여
      ,j.grade_level as 등급
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
-- 사원명     | 상사명 출력
-- last_name | last_name
select e.last_name as 사원
      ,m.last_name as 멘토
from employees e, employees m
where e.employee_id = m.manager_id(+);

select e.last_name as 사원
      ,m.last_name as 멘토
from employees e left join employees m
on e.employee_id = m.manager_id;

-- natural join 
select last_name, department_name
from employees join departments
using(department_id); -- 조인 조건 명시

select e.last_name       as 사원명
      ,d.department_name as 부서명
      ,j.grade_level     as 등급
from employees e ,departments d ,job_grades j
where e.department_id = d.department_id(+)
and   e.salary between j.lowest_sal and j.highest_sal;

select e.last_name       as 사원명
      ,d.department_name as 부서명
      ,e.salary          as 급여
      ,j.grade_level     as 등급
from employees e 
left join departments d 
on e.department_id = d.department_id
inner join job_grades j
on e.salary between j.lowest_sal and j.highest_sal;

select e.last_name       as 사원명
      ,d.department_name as 부서명
      ,m.last_name       as 사수명
      ,lo.city           as 도시명
      ,j.job_title       as 업무
from employees e ,departments d ,employees m ,locations lo 
    ,jobs j 
where e.department_id = d.department_id(+)
and   e.manager_id = m.employee_id(+)
and   d.location_id = lo.location_id(+)
and   e.job_id = j.job_id;

select e.last_name       as 사원명
      ,d.department_name as 부서명
      ,m.last_name       as 사수명
      ,lo.city           as 도시명
      ,j.job_title       as 업무
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
select e.LAST_NAME       as 사원명
      ,e.SALARY          as 급여
      ,j.GRADE_LEVEL     as 등급
      ,d.DEPARTMENT_NAME as 부서명 
      ,lo.city           as 도시명
      ,c.country_name    as 나라명
from employees e 
inner join job_grades j
on e.salary between j.lowest_sal and j.highest_sal
left join departments d
on e.department_id = d.department_id
left join locations lo
on d.location_id = lo.location_id
left join countries c
on lo.country_id = c.country_id;

select e.LAST_NAME       as 사원명
      ,e.SALARY          as 급여
      ,j.GRADE_LEVEL     as 등급
      ,d.DEPARTMENT_NAME as 부서명 
      ,lo.city           as 도시명
      ,c.country_name    as 나라명
from employees e, job_grades j, 
    departments d ,locations lo ,countries c
where e.salary between j.lowest_sal and j.highest_sal
and   e.department_id = d.department_id(+)
and   d.location_id = lo.location_id(+)
and   lo.country_id = c.country_id(+);


