use HR

/* Queries Practice */

/* Select Entire Table */
select * 
from departments

/* Select specific columns (attributes) */
select first_name , email , salary 
from employees

/* Select specific columns (attributes)  , using arthimeticoperations with columns alias i.e [column doesnot exit , but we create a calculation on runtime  ,Keyword = as]  */
select first_name , email , salary , 12*salary as annual_salary_of_Employees
from employees

/* Actual columns ka name bhi column alias say change krsktay hain , agr case-sensitive yan special characters hon tu "" use krein gy */
select first_name + last_name as "Full Name" , email as EmailId
from employees

/* Concatenation Operator + Literal Character Strings i.e ' is present in' */
select CONCAT(street_address ,' ',city ,' is present in ' , country_id) as "State-Information"
from locations

/* Select distinct to fetch unique records in a column */

EXEC sp_help departments