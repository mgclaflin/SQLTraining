--write a query to assign a row number to each employee based on their salary, starting from the highest paid employee
select row_number() over (order by salary desc) as row_num, employee_id, first_name, last_name, j.job_title, salary
from employees join jobs j on employees.job_id=j.job_id;


-- write a query to rank employees based on their salary within their deparent_id
select employee_id, first_name, last_name, department_id, salary, RANK() over (partition by department_id order by salary desc) as rank_in_department
from employees
order by department_id, rank_in_department;


--Write a query to display the salary from each employee and the salary of the previous employee in the same department, using the LAG() function
select employee_id, department_id, salary, coalesce(lag(salary) over(partition by department_id order by salary desc),0) as previous_emp_salary
from employees
order by department_id, salary desc;


--write a query to show the hire_date for each employee and the hire_date of the next employee in the same department using the lead function
select employee_id, department_id, hire_date, lead(hire_date) over(partition by department_id order by hire_date asc) as next_emp_hire_date
from employees
order by department_id, hire_date asc;


--write a CTE to calculate the total salary per department and then use the CTE to list departments that have a total salary greater than 20,000
with department_salary_totals as (
	select department_id, sum(salary) as total_salary
	from employees
	group by department_id
)

select d.department_name, st.department_id, st.total_salary
from department_salary_totals st join departments d on st.department_id = d.department_id
where st.total_salary>20000;


--write a recursive query to find the hierarchy of employees in the employees table, starting from the manager_id and displaying the employee's name and their manager's name
with recursive employee_hierarchy as (
	--base case: select the top level managers
	select employee_id, manager_id, first_name, 1 as level
	from employees 
	where manager_id is null

	union all

	--recursive case: selects employees reporting to the above employees 
	select e.employee_id, e.manager_id, e.first_name, eh.level+1
	from employees e
	join employee_hierarchy eh on e.manager_id = eh.employee_id
)

select * from employee_hierarchy order by level;


--write a query to find the total number of employees, min salary, max salary, and the average salary for each job_title
select j.job_title, count(e.employee_id) as employees_with_job, min(e.salary) as min_salary, max(e.salary) as max_salary, round(avg(e.salary),2) as avg_salary
from employees e join jobs j on e.job_id=j.job_id
group by j.job_title
order by employees_with_job desc;


--write a query to find the top 3 highest paid employees within each department, displaying their salary & rank
with ranked_employees as (
	select e.employee_id, e.first_name, e.last_name, d.department_name, e.salary, rank() over (partition by d.department_name order by e.salary desc) as salary_rank_in_department
	from employees e join departments d on e.department_id=d.department_id
)

select *
from ranked_employees r
where salary_rank_in_department <=3
order by r.department_name, r.salary desc;






