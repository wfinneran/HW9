--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
	
	INNER JOIN salaries ON salaries.emp_no = employees.emp_no
	
--2. List employees who were hired in 1986.
SELECT *
FROM employees
WHERE employees.hire_date BETWEEN '1986-01-01' AND '1986-12-31'

--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.

SELECT dept_manager.dept_no, 
	departments.dept_name,
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	dept_manager.from_date,
	CASE WHEN dept_manager.to_date = '9999-01-01' THEN current_date ELSE dept_manager.to_date END
FROM dept_manager

	INNER JOIN titles ON titles.emp_no = dept_manager.emp_no
	INNER JOIN departments ON departments.dept_no = dept_manager.dept_no
	INNER JOIN employees ON employees.emp_no = dept_manager.emp_no
	
WHERE titles.title = 'Manager'

--4. List the department of each employee with the following information: employee number, last name, first name, 
--and department name.

SELECT employees.emp_no, 
employees.last_name, 
employees.first_name, 
departments.dept_name,
CASE WHEN dept_emp.to_date = '9999-01-01' THEN current_date ELSE dept_emp.to_date END
FROM employees

	INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
	INNER JOIN departments ON departments.dept_no = dept_emp.dept_no

WHERE dept_emp.to_date = '9999-01-01'


--5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.last_name, employees.first_name
FROM employees

WHERE employees.first_name = 'Hercules'
AND employees.last_name LIKE 'B%'


--6. List all employees in the Sales department, including their employee number, last name, first name, 
--and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
	
	INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
	INNER JOIN departments ON departments.dept_no = dept_emp.dept_no

WHERE departments.dept_name = 'Sales'

--7. List all employees in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
	
	INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
	INNER JOIN departments ON departments.dept_no = dept_emp.dept_no

WHERE departments.dept_name IN ('Sales', 'Development')

ORDER BY departments.dept_name

--8. In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.

SELECT employees.last_name, COUNT(employees.last_name)
FROM employees

GROUP BY employees.last_name
