use HR
/* Signle roW FUNCTIONS   
One result per row: For every row in the result set, a single-row function produces one corresponding output value. 
TYPES :- 
Character 
Number
Date
Conversion 
General*/

/* Character Functions */
/* Sub-Type : Case-Manipulation */ 
/* default case-insensitive collations */

select employee_id , UPPER (CONCAT(first_name , ' ',last_name)) as fullname , phone_number
from employees
where last_name = 'AHMAD'

select LOWER('DAOUD HAROON DAR') as BOSS

/* initcap is not in mysql */ 


/* Sub-Type : Character-Manipulation */ 

select SUBSTRING(phone_number , 9 , 4) as Ending_digits_of_phone_Number , phone_number 
from employees


select first_name , email , LEN(first_name) as StringLength
from employees
where LEN(first_name) = 5


Select CHARINDEX('s' , '__Shifa') 

select replicate('*', 4) + LEFT(first_name,4) as '4* and Left say 9 chars of first_name'
from employees

SELECT RIGHT(REPLICATE('0', 3) +
LEFT('1234', 2), 2);   /* LEFT() and RIGHT() are used to fetch chars from a string either from left or right */
/* Explained */ 
/*REPLICATE('0', 3) jsut repeates string '0' 3 times ,
 + concates , LEFT('1234', 2) gives say left say 2 char i.e 12
 now the expression has become RIGHT(00012,2) which gives 12 , but left to right he hoga  */


 SELECT TRIM('Hello' FROM 'HelloWorld')

/* practice Query from gpt 
Write a SQL query that:
Displays the employee_id
Displays the employee’s full name (first name and last name combined with a space)
Displays the job_id
Displays the length of the first name
Displays the position of the letter 'a' in the first name
Only includes employees whose salary is greater than 6000
Only includes employees whose phone_number mids with '123' */


select employee_id , CONCAT(first_name ,' ', last_name) as full_name ,
employee_id , LEN(first_name) , CHARINDEX('a' , first_name) , phone_number , salary
from employees 
where salary > 6000
AND SUBSTRING(phone_number , 5 , 3) = 123
/* agr hum INSTR USE krtay i.e INSTR(phone_number , '123'), it will check k string mei khei bhi 123 hoga tu it will show it */



/* Number Function */ 


/* DATE Functions */
select first_name , hire_date 
from employees
where hire_date >= '2000-01-01'  /* january 2000 , mei or baad mei kitnay logon nay join kia */
order by hire_date

/* Add or subtract a number to or from a date for a
resultant date value.

Subtract two dates to find the number of days
between those dates.

Add hours to a date by dividing the number of
hours by 24. */


select last_name , DATEDIFF(DAY , hire_date , SYSDATETIME())/7 as weeks
from employees
where department_id=90  /* Datediff function , gives days/months/year , from start to end date */

/* Conversions , Implicit and Explicit 
Implicit sql khud krdyta , Explicit khud krtay hain using CAST/Convert */
/* CONVERT(data_type(length), expression, style) */
SELECT CONVERT(DATE, '24/02/2026', 103) /* 103 is standard style */
SELECT CONVERT(VARCHAR(10), 12345)
SELECT TRY_CONVERT(INT, 'ABC') /* If the string is not numeric , ou get an error.Safer version: */

/* CAST(expression AS data_type(length)) */
SELECT CAST('123' AS INT)

/* general functions */
SELECT last_name, salary,
       COALESCE(
           CAST(manager_id AS VARCHAR(20)),
           phone_number,
           'no phone number'
       ) AS New_Column
FROM employees
ORDER BY salary; /* COALESCE checks first column , if null , checks other column  , can be multiple checks, if not present then hardcoded value */
/* COALESCE() requires all arguments to be of compatible data types */

