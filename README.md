# SQLTraining

### **📌 SQL Practice & Advanced Querying**  

🚀 **Goal:** Strengthen SQL skills by practicing queries related to **basic SQL, joins, subqueries, window functions, and CTEs** using the **HR Sample Database** in PostgreSQL.

---

## **📝 SQL Concepts Covered**
### ✅ **Basic SQL Queries**
- Selecting data using **`SELECT`**  
- Filtering data using **`WHERE`**  
- Sorting results with **`ORDER BY`**  
- Grouping and aggregating data with **`GROUP BY`**  
- Limiting results using **`LIMIT`**  

### ✅ **Joins & Subqueries**
- Combining tables using **`INNER JOIN`**, **`LEFT JOIN`**, **`RIGHT JOIN`**, and **`FULL JOIN`**  
- Writing **subqueries** using **`EXISTS`**, **`IN`**, and **`NOT IN`**  

### ✅ **Advanced SQL**
- Using **window functions** (`ROW_NUMBER()`, `RANK()`, `LAG()`, `LEAD()`)  
- Implementing **Common Table Expressions (CTEs)** and **recursive queries**  

---

## **📂 Repository Structure**
```
/sql-practice
│── README.md                 # Project documentation
│── hr-schema.sql	       # SQL database schema creation queries
│── hr-data.sql		       # SQL queries to insert data into the created tables
│── /Queries
	│── basic_queries.sql         # Basic SELECT, WHERE, GROUP BY, ORDER BY, LIMIT
	│── joins_subqueries.sql      # Joins, EXISTS, IN, NOT IN queries
	│── advanced_sql.sql          # Window functions, CTEs, recursive queries

```

---

## **🛠️ How to Use**
1. **Clone the repository:**  
2. **Open pgAdmin or psql** and load the **hr-schema and hr-data**.  
3. **Run SQL scripts** in PostgreSQL to test different queries.

---

## **📌 Example Queries**
### **1️⃣ Basic Query: Retrieve Employees Earning Over $50,000**
```sql
SELECT first_name, last_name, salary
FROM employees
WHERE salary > 50000
ORDER BY salary DESC;
```

### **2️⃣ Joins: List Employees with Their Department Names**
```sql
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
```

### **3️⃣ Subquery: Find Employees in Departments with Salaries Above $5,000**
```sql
SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
WHERE EXISTS (
    SELECT 1 FROM employees e2
    WHERE e2.department_id = e.department_id
    AND e2.salary > 5000
);
```

### **4️⃣ Window Function: Rank Employees by Salary**
```sql
SELECT employee_id, first_name, last_name, salary,
       RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
FROM employees;
```

### **5️⃣ CTE: Get Employees and Their Managers**
```sql
WITH EmployeeHierarchy AS (
    SELECT employee_id, first_name, last_name, manager_id
    FROM employees
)
SELECT e1.first_name AS Employee, e2.first_name AS Manager
FROM EmployeeHierarchy e1
LEFT JOIN EmployeeHierarchy e2 ON e1.manager_id = e2.employee_id;
```
