--List the employee number, last name, first name, sex, and salary of each employee.

select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
  from employee emp
inner join salaries sal on
emp.emp_no = sal.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select emp.first_name, emp.last_name, emp.hire_date
  from employee emp
 where to_char(emp.hire_date, 'YYYY') = '1986';

-- List the manager of each department along with their 
-- department number, department name, employee number, last name, and first name.

select dm.dept_no, dept.dept_name, dm.emp_no, emp.first_name, emp.last_name 
  from dept_manager dm
inner join departments dept on
dm.dept_no = dept.dept_no
inner join employee emp on
dm.emp_no = emp.emp_no;

-- List the department number for each employee 
-- along with that employee’s employee number, last name, first name, and department name.
select emp.emp_no, emp.first_name, emp.last_name, dept.dept_no, dept.dept_name
  from employee emp
inner join dept_emp de on
emp.emp_no = de.emp_no
inner join departments dept on
de.dept_no = dept.dept_no;
  
-- List the first name, last name, and sex of each employee 
-- whose first name is Hercules and whose last name begins with the letter B.
select emp.first_name, emp.last_name, emp.sex
  from employee emp
 where emp.first_name = 'Hercules' 
   and emp.last_name like 'B%';
  
  
-- List each employee in the Sales department, 
-- including their employee number, last name, and first name.

select emp.emp_no, emp.first_name, emp.last_name 
  from employee emp
inner join dept_emp de on
emp.emp_no = de.emp_no
where de.dept_no = (select dept_no 
                      from departments
                     where dept_name = 'Sales' );
  


-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
select emp.emp_no, emp.first_name, emp.last_name, dept.dept_name 
  from employee emp
inner join dept_emp de on
emp.emp_no = de.emp_no
inner join departments dept on
de.dept_no = dept.dept_no
where de.dept_no in (select dept_no 
                      from departments
                     where dept_name in ('Sales', 'Development'));

-- List the frequency counts, in descending order, 
-- of all the employee last names (that is, how many employees share each last name).
select last_name, count(last_name) as cnt
  from employee 
group by last_name  
order by count(last_name) desc;