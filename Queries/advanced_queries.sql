--write a query to assign a row number to each employee based on their salary, starting from the highest paid employee
select row_number() over (order by salary desc) as row_num, employee_id, first_name, last_name, j.job_title, salary
from employees join jobs j on employees.job_id=j.job_id;

