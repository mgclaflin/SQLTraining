-- write a query to list the names of employees along with their deparment name
select e.employee_id, e.first_name, e.last_name, d.department_name
from employees e join departments d on e.department_id=d.department_id
order by d.department_name asc;

-- write a query to show all employees and their department names, even if they are not assigned to a department
select e.employee_id, e.first_name, e.last_name, d.department_name
from employees e left join departments d on e.department_id=d.department_id
order by d.department_name asc NULLS LAST;

--write a query to list all departments and their employees, including departments that don't have employees
select e.employee_id, e.first_name, e.last_name, d.department_name
from employees e right join departments d on e.department_id=d.department_id
order by d.department_name asc NULLS LAST;

--write a query to return all employees and departments, showing even those that don't have a matching entry in the other table
select e.employee_id, e.first_name, e.last_name, d.department_name
from employees e cross join departments d
order by d.department_name asc NULLS LAST;

--write a query to find all employees who are working in a department where at least one employee has a salary greater than 5000
select e.employee_id, e.first_name, e.last_name, e.salary, e.department_id
from employees e 
where e.department_id IN (
	select d.department_id
	from employees e join departments d on e.department_id=d.department_id
	where e.salary>5000);

--rewrite the query to use "EXISTS" instead of "IN", more efficient for large datasets
SELECT e.employee_id, e.first_name, e.last_name, e.salary, e.department_id
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e2.department_id = e.department_id
    AND e2.salary > 5000);

--write a query to find all employees who do not work in deparments with a department_id >= 6
select e.employee_id, e.first_name, e.last_name, e.department_id
from employees e 
where e.department_id<=5;

--write the same query but using NOT IN
select e.employee_id, e.first_name, e.last_name, e.department_id
from employees e 
where e.employee_id NOT IN (
	select employee_id
	from employees
	where department_id>=6);













