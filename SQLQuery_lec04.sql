/* Using the Group Functions
Group functions operate on sets of rows to give one
result per group. Examples 
AVG , COUNT , MAX , MIN ,STDDEV , SUM , VARIANCE

** Group functions ignore null values in the column: **
**The NVL function forces group functions to include null values:**
*/

select * from employees

select MAX(salary) as MAX_Salary , AVG(salary) as AVG_Salary , 
 MIN(salary) as MIN_Salary , SUM(salary) as Total_Salary , 
 COUNT(employee_id) as total_emp , MIN(hire_date) as Oldest_Emp ,
 MAX(hire_date) as Newest_Emp
from employees


/* count , distinct , NVL */ 
/* COUNT(*) returns the number of rows in a table: */ 
select count(*) as No_of_emps_in_depart_10
from employees
where department_id=10 

/* COUNT(expr) returns the number of rows with non-null values for the expr: */
select COUNT(manager_id)
from employees
where department_id=9  /* number of non-null records , in the depart 9 */

select COUNT(DISTINCT department_id)
from employees  /* number of departs */



/* Creating Groups of Data: GROUP BY Clause  */

SELECT department_id, AVG(salary) as avg_salary_per_depart ,
Count(department_id) as no_of_emp_per_depart
FROM employees
GROUP BY department_id ;


/* group by on multiple columns */ 
SELECT department_id dept_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id 
ORDER BY department_id

/* The maximum salary per department when it is greater than $10,000 */

select department_id , MAX(salary) 
from employees
GROUP BY department_id
HAVING MAX(salary) > 10000


SELECT job_id, SUM(salary) PAYROLL , COUNT(employee_id) as no_of_emp_in_job
FROM employees
WHERE job_id NOT IN  (6,5)
GROUP BY job_id
HAVING SUM(salary) > 13000
ORDER BY SUM(salary);/* will create groups for every job , except job 2 , then checking thier Sum(salary) > 13000*/ 

/* Nesting group functions */ 
SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id; /* Display the maximum average salary: */


/* PRACTICE QUERIES */
/* Count how many employees have a manager (manager_id not NULL). */
select COUNT(employee_id)
from employees
where manager_id IS NOT NULL

/* Show the number of employees under each manager.*/
select manager_id ,COUNT(employee_id) as ppl_working_under
from employees
where manager_id IS NOT NULL
group by manager_id
ORDER BY manager_id


/* Show managers who manage more than 2 employees. */
select manager_id ,COUNT(employee_id) as ppl_working_under
from employees
where manager_id IS NOT NULL
group by manager_id
HAVING COUNT(employee_id) > 2
ORDER BY manager_id



/* Find departments where average salary is greater than the overall average salary. */
select department_id , AVG(salary) as avg_salary_per_depart
from employees
GROUP BY department_id
HAVING AVG(salary) >  (select AVG(salary)from employees)