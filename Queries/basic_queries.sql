--write a query to select all columns from the each table
select * from employees;
select * from countries;
select * from departments;
select * from dependents;
select * from jobs;
select * from locations;
select * from regions;

--write a query to select all employees who have a job_id of "Programmer" from the employees table
select e.employee_id, e.first_name, e.last_name, e.hire_date, e.salary, e.manager_id, j.job_title 
from employees e join jobs j on e.job_id = j.job_id
where j.job_title = 'Programmer'
order by e.salary desc;

--write a query to select employees who are in department_id of 9
select * from employees where department_id=9;

--write a query to select employees & order them by last_name alphabetically
select employee_id, first_name, last_name
from employees
order by last_name asc;

--write a query to list employees ordered by hire_date in descending order
select * from employees order by hire_date desc;


--write a query to count the total number of employees 
select count(employee_id) as total_employees from employees;

--write a query to calculate the average salary of all employees 
select round(avg(salary),2) as avg_salary from employees;

--write a query to find the total number of employees in each deparment_id 
--& only show deparments with more than 2 employees
select d.department_name, count(e.department_id) as num_employees
from employees e join departments d on e.department_id=d.department_id
group by d.department_name
having count(e.department_id)>2
order by num_employees asc;

--write a query to find the highest salary in each department
select d.department_name, max(e.salary)
from employees e join departments d on e.department_id=d.department_id
group by d.department_name;


--write a query to return the first 10 employees who were hired, ordered by hire_date
select employee_id, first_name, last_name, hire_date, salary
from employees
order by hire_date asc
Limit 10;


--write a query to get the top 5 highest paid employees based on their salary, descending order
select e.employee_id, e.first_name, e.last_name, e.hire_date, j.job_title, d.department_name, e.salary 
from employees e join jobs j on e.job_id=j.job_id join departments d on e.department_id=d.department_id
order by e.salary desc
limit 5;





