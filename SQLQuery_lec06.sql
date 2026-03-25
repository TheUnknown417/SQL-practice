 /* SUB QUERIES
 Guidelines for Using Subqueries

* Enclose subqueries in parentheses.

* Place subqueries on the right side of the
comparison condition.

* Use single-row operators with single-row
subqueries, and use multiple-row operators with
multiple-row subqueries. */ 

select * from employees

 /* Single Row Subquries */ 
 SELECT last_name, job_id, salary
FROM employees
WHERE job_id =

			(SELECT job_id
			FROM employees
			WHERE employee_id = 145)
AND salary >
				(SELECT salary
				FROM employees
				WHERE employee_id = 146);


/* Using Group Functions in a Subquery */ 
SELECT last_name, job_id, salary
FROM employees
WHERE salary =
				(SELECT MIN(salary)
				FROM employees);

/* employees with salaries lesser than the average salary */ 
SELECT last_name, job_id, salary
FROM employees
WHERE salary <
				(SELECT AVG(salary)
				FROM employees);


/* The HAVING Clause with Subqueries
The Oracle server executes subqueries first.
The Oracle server returns results into the HAVING
clause of the main query.*/

SELECT department_id, MIN(salary) as 'Min Salary of each Dep'
FROM employees
GROUP BY department_id
HAVING MIN(salary) >
						(SELECT MIN(salary)
						FROM employees
						WHERE department_id = 10);




/* Multiple Row Sub-queries 
Return more than one row
Use multiple-row comparison operators
1. IN -> Equal to any member in the list
2. ANY -> Compare value to each value returned by the subquery
3. ALL -> Compare value to every value returned by the subquery
*/

/* 
Find all employees (excluding IT Programmers) whose salary is less than
any of the salaries earned by IT Programmers. Display their employee ID, last name, job ID, and salary */
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY  /* can also use ALL here , but then results will be compared with all results of subquery*/
						(SELECT salary
						FROM employees
						WHERE job_id = 9)
AND job_id <> 9;


/* Practice Queries */

/* Find the employees who work in the same department as employee 108. 
Display their employee_id, last_name, and department_id. */

select employee_id , last_name , department_id
from employees
where department_id = 
						(SELECT department_id
						from employees
						where employee_id = 108 )


/* Find all employees whose salary is greater than the average salary of their department. 
Display employee_id, last_name, salary, and department_id */ 

select employee_id , last_name , salary , department_id 
from employees e
where salary >
				(select AVG(salary) 
				from employees
				where department_id = e.department_id
				)
				

/* Find employees whose salary is greater than all employees
in department 6. Display employee_id, last_name, salary. */

select employee_id , last_name , salary
from employees
where salary > ALL  /* if ALL is not used , then Select MAX(salary) */
					(select salary 
					from employees
					where department_id = 6)

