SELECT emp_no, first_name, last_name
FROM employees
;
SELECT title, from_date, to_date
FROM titles
;

SELECT emp.emp_no, emp.first_name, emp.last_name, ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees AS emp
INNER JOIN titles AS ti ON emp.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp.emp_no
;

SELECT * FROM retirement_titles
DROP retirement_titles


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

SELECT DISTINCT ON (emp.emp_no) emp.emp_no, emp.first_name, emp.last_name, emp.birth_date, de.from_date, de.to_date, ti.title
INTO mentorship_eligibility
FROM employees AS emp
INNER JOIN dept_emp AS de ON de.emp_no= emp.emp_no
INNER JOIN titles AS ti ON emp.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date = '9999-01-01')
ORDER BY emp_no

SELECT * FROM mentorship_eligibility


