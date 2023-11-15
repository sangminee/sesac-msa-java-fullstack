-- 전체 사원의 평균 급여보다 적은 급여를 받고 있는 사원들의 이름을 출력
select last_name, salary
from employees
where salary < (select avg(salary) 
                from employees);

-- Mourgos의 직속 부하 사원 이름 모두 출력
select last_name
from employees
where manager_id = (select employee_id 
                    from employees 
                    where last_name = 'Mourgos');

-- 업무가 IT_PROG인 사원들의 평균 급여보다 적은 급여를 받는 사람들을 출력
select last_name
from employees
where salary < (select avg(salary) 
                from employees 
                where job_id = 'IT_PROG'); 