--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no as "Employee Number", last_name as "Surname", first_name as "Given Name", sex as "Sex", salary as "Salary"
FROM employees as e 
INNER JOIN salaries as s ON s.emp_no = e.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name as "Given Name", last_name as "Surname",  hire_date as "Date of Hire"
FROM employees
WHERE CAST(SUBSTRING(hire_date FROM 7 FOR 4) AS INTEGER) = 1986;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name as "Given Name", last_name as "Surname",  sex as "Sex"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no as "Employee Number", last_name as "Surname", first_name as "Given Name"
FROM employees as e
LEFT JOIN dept_emp as de ON de.emp_no = e.emp_no
LEFT JOIN dept_manager as dm ON dm.emp_no = e.emp_no
LEFT JOIN departments as d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no as "Employee Number", last_name as "Surname", first_name as "Given Name", dept_name as "Department"
FROM employees as e
LEFT JOIN dept_emp as de ON de.emp_no = e.emp_no
LEFT JOIN dept_manager as dm ON dm.emp_no = e.emp_no
LEFT JOIN departments as d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT "last_name" as "Surname", count(last_name)
FROM employees
GROUP BY "Surname"
ORDER BY count DESC;