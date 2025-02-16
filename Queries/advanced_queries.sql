--write a query to assign a row number to each employee based on their salary, starting from the highest paid employee
select row_number() over (order by salary desc) as row_num, employee_id, first_name, last_name, j.job_title, salary
from employees join jobs j on employees.job_id=j.job_id;

-- write a query to rank employees based on their salary within their deparent_id
select employee_id, first_name, last_name, department_id, salary, RANK() over (partition by department_id order by salary desc) as rank_in_department
from employees
order by department_id, rank_in_department;

--Write a query to display the salary from each employee and the salary of the previous employee in the same department, using the LAG() function
