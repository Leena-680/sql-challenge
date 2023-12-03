-- Insert data into table titles

INSERT INTO titles VALUES ('s0001', 'Staff');
INSERT INTO titles VALUES ('s0002', 'Senior Staff');
INSERT INTO titles VALUES ('e0001', 'Assistant Engineer');
INSERT INTO titles VALUES ('e0002', 'Engineer');
INSERT INTO titles VALUES ('e0003', 'Senior Engineer');
INSERT INTO titles VALUES ('e0004', 'Technique Leader');
INSERT INTO titles VALUES ('m0001', 'Manager');

-- Insert data into table 
INSERT INTO departments VALUES ('d001', 'Marketing');
INSERT INTO departments VALUES ('d002', 'Finance');
INSERT INTO departments VALUES ('d003', 'Human Resources');
INSERT INTO departments VALUES ('d004', 'Production');
INSERT INTO departments VALUES ('d005', 'Development');
INSERT INTO departments VALUES ('d006', 'Quality Management');
INSERT INTO departments VALUES ('d007', 'Sales');
INSERT INTO departments VALUES ('d008', 'Research');
INSERT INTO departments VALUES ('d009', 'Customer Service');

-- Import file employees.csv
select count(*) from employee;
-- 300024

-- Import file salaries.csv
select count(*) from salaries;
-- 300024

-- Import file dept_manager.csv
select count(*) from dept_manager;
-- 24

-- Import file dept_emp.csv
select count(*) from dept_emp;
-- 331603







